(* ::Package:: *)

(* ::Chapter:: *)
(*Landau Functions*)


(* ::Section:: *)
(*Codes*)


(* ::Subsection:: *)
(*Preliminary Setup*)


Get["SPQR`"]
Get["DiscKosky`"]


Off[FF::logerr]


If[!And[MemberQ[$ContextPath,"SPQR`"],MemberQ[$ContextPath,"DiscKosky`"]],Print["ERROR: SPQR or DiscKosky not loaded. Functions will work correctly."];];


(* ::Subsection:: *)
(*Degeneracy Checks*)


(*codes for checking Type 1.2 caveat*)
(*see examples for working function usage*)


degenerateForKinAndVar[ideal_,vars_,params_,var_,param_]:=Module[
	{
		primeIndex,newVars,newParams,sub1,sub2,paramsNsubs,gbs,gcd,i
	},
	
	primeIndex = RandomInteger[{0,200}];
	newVars = {param}~Join~Complement[vars,{var}];
	newParams = {var}~Join~Complement[params,{param}];
	sub1 = newParams[[2;;]]->RandomInteger[{1,10^20},Length[newParams]-1]//Thread;
	sub2=newParams[[1;;1]]->RandomInteger[{1,10^20},{1,2}]//Thread//Map[Thread]//Transpose;
	paramsNsubs = Table[sub1~Join~sub2[[i]],{i,1,sub2//Length}];
	
	gbs = Monitor[
			Table[
				GroebnerBasis[
					ideal // ReplaceAll[paramsNsubs[[i]]],
					newVars[[1;;1]],
					newVars[[2;;]],
					CoefficientDomain->RationalFunctions,
					Modulus->FFPrimeNo[primeIndex],
					MonomialOrder->EliminationOrder
				] // First
			,
				{i,1,paramsNsubs//Length}
			]
		,
			ToString[i]<>"/2"
		];
	gcd = gbs//Apply[PolynomialGCD[##,Modulus->FFPrimeNo[primeIndex]]&];
	Return[{gcd,sub1,primeIndex}];
];

Options[noDegeneracyQ] = {"FullData"->False,"Parallel"->False};
noDegeneracyQ[gpol_,gpolvars_,opts:OptionsPattern[]]:=Module[
	{
		vars,x0,ideal,params,data,allGCDs,kinpts,noDegeneracyQout,primes
	},
	
	If[!PolynomialQ[gpol],Print["Warning: gpol must be a polynomial!"]; Return[$Failed];];
	
	vars = {x0}~Join~gpolvars;
	ideal = {1-vars[[1]]*gpol}~Join~D[gpol,{vars[[2;;]]}];

	params = Complement[ideal//Variables,vars];
	If[params==={},
		If[OptionValue["FullData"],Print["Warning: Requesting kinematic slice data when no kinematics exist. Ignoring the option"]];
		Return[{True}];
	];
	If[OptionValue["Parallel"],
		DistributeDefinitions[FFPrimeNo];
		ParallelEvaluate[Off[FrontEndObject::notavail]];
		data = ParallelTable[
				degenerateForKinAndVar[ideal,vars,params,var,param]
			,
				{param,params}
			,
				{var,vars}
			,
				Method->"FinestGrained"
			];
	,
		data=Monitor[
			Table[
				degenerateForKinAndVar[ideal,vars,params,var,param]
			,
				{param,params}
			,
				{var,vars}
			]
		,
			{param,var}
		];
	];
	
	allGCDs = data[[;;,;;,1]];
	kinpts = data[[;;,;;,2]];
	primes = data[[;;,;;,3]] // Map[FFPrimeNo,#,{2}]&;
	noDegeneracyQout=(allGCDs // Flatten // DeleteDuplicates)=={1}//TrueQ;
	If[OptionValue["FullData"],
		Return[{noDegeneracyQout,allGCDs,kinpts,primes}];
	,
		Return[{noDegeneracyQout}];
	];
];
checkAllDegenFound[degenQdata_,onlyIndeterminateSings_]:=Module[{factorList,facts1,facts2},
	factorList[a_,b_]:=Map[FactorList[#1,Modulus->b]&][a];
	facts1=MapThread[factorList[Factor[#1,Modulus->#2],0]&,{onlyIndeterminateSings//ReplaceAll[degenQdata[[3]]],degenQdata[[4]]},2]//Flatten//DeleteCases[x_?IntegerQ]//SortBy[Length];
	facts2=MapThread[FactorList[#1,Modulus->#2]&,{degenQdata[[2]],degenQdata[[4]]},2]//Flatten//DeleteCases[x_Integer];
	Return[Complement[facts2,facts1]==={}];
];


(* ::Subsection:: *)
(*Landau Analysis*)


(*proof of concept codes for finding Landau singularities*)
(*see examples for working function usage*)


Options[SPQRLandau]={"weight"->{1,15},"PrintDebugInfo"->0,"AutoDehomogenise"->False,"CheckCaveats"->False,"Sort"->False};
SPQRLandau[gpol_,gpolvars_,opts:OptionsPattern[]]:=Module[
	{
		x0,vars,ideal,w,irreds,cmats,elimMons,elimSyst,rec,landau,kin,kinsub,landauh,extraSing,
		irreds2,ideal1,caveatType1p2,caveatType2p1,spuriousSings,caveatList,noDegenQTest,chiSBS,
		chiReg,dropIndex,genuineSings,singularitiesChi
	},
	
	(*identifying kinematics*)
	kin = Complement[gpol // Variables,gpolvars] // Variables;
	If[OptionValue["AutoDehomogenise"],
		kinsub = {kin[[-1]]->1};
		PrintTemporary["Automatically dehomogenising with ",kinsub];
	,
		kinsub={};
	];
	
	(*ideal generation*)
	vars = {x0}~Join~gpolvars;
	ideal1 = {1-vars[[1]]*gpol}~Join~D[gpol,{vars[[2;;]]}];
	ideal = ideal1 // ReplaceAll[kinsub];
	w = OptionValue["weight"];
	If[OptionValue["Sort"],
		vars = SortVariables[ideal,vars];
	];
	
	PrintTemporary["computing irreducible monomials"];
	irreds = FindIrreducibleMonomials[ideal,vars,"MonomialOrder"->DegreeReverseLexicographic];
	
	(*checking type 1.1 caveats*)
	If[irreds==\[Infinity],
		Print["higher dimensional solution found in this sector. Cannot proceed further."];
		If[OptionValue["CheckCaveats"],
			Return[Association["Singularities"->$Failed,"PossibleCaveats"->{"Type 1.1"},"SpuriousSingularities"->$Failed]];
		,
			Return[Association["Singularities"->$Failed]];
		];
	];
	
	caveatType1p2 = True;
	caveatType2p1 = True;
	caveatList = {};
	
	If[OptionValue["CheckCaveats"],
		
		(*checking type 1.2 caveats*)
		PrintTemporary["checking if degenerate singularities can occur"];
		noDegenQTest = noDegeneracyQ[gpol,gpolvars,"Parallel"->True][[1]];
		If[noDegenQTest,
			PrintTemporary["no degenerate singularities found"];
			caveatType1p2 = False;
		,
			Print["warning: degenerate singularities found, caveats of Type 1.2 WILL occur in this sector"];
		];
		
		(*checking type 2.1 caveats*)
		PrintTemporary["computing the full Euler characteristic sector by sector"];
		chiSBS = CountSectorsUnregulated[gpol,gpolvars,{}][[1]];
		PrintTemporary["sector by sector Euler characteristic = ",chiSBS];
		
		PrintTemporary["computing the full Euler characteristic using analytic regulators, this may take a few moments"];
		chiReg = CountSectorsRegulated[gpol,gpolvars,{}];
		PrintTemporary["regulated Euler characteristic = ",chiReg];
		
		If[chiSBS=!=Indeterminate,
			If[chiReg===chiSBS,
				PrintTemporary["sector by sector and regulated Euler characteristics agree"];
				caveatType2p1 = False;
			,
				Print["warning: Sector by sector and regulated Euler characteristics do NOT agree. Caveats of Type 2.1 WILL occur somewhere in this integral family"];
			];
		,
			Print["warning: a subsector of this graph has higher dimensional solutions, comparison of the full number of master integrals against the regulated Euler characteristic is not possible. Caveats of Type 2.1 might occur, but are unlikely"];
		];
		If[caveatType1p2, caveatList = Join[caveatList,{"Type 1.2"}]];
		If[caveatType2p1, caveatList = Join[caveatList,{"Type 2.1"}]];
	];
	
	If[Length[irreds]===0,
		If[OptionValue["CheckCaveats"],
			Return[Association["Singularities"->{},"PossibleCaveats"->caveatList,"SpuriousSingularities"->{}]];
		,
			Return[Association["Singularities"->{}]];
		];
	];
		
	PrintTemporary["found ", irreds // Length, " irreducible monomials"];
	
	(*begin graph setup in SPQR / Finiteflow*)
	PrintTemporary["building companion matrices"];
	cmats = BuildCompanionMatrices[ideal,vars,w,irreds,"MonomialOrder"->DegreeReverseLexicographic,"PrintDebugInfo"->OptionValue["PrintDebugInfo"]];
	If[cmats===$Failed,Print["Error: system could not close at given weight. Try increase the \"weight\" option"];Return[$Failed]];
	
	PrintTemporary["finding elimination monomials"];
	elimMons = Monitor[Table[FindEliminationMonomials[ideal,Complement[vars,{var}],{var}],{var,vars}],var]//Flatten[#,1]&;
	
	PrintTemporary["building the elimination system"];
	elimSyst = BuildEliminationSystems[cmats,elimMons];
	(*end graph setup in SPQR / Finiteflow*)
	
	(*reconstruction*)
	PrintTemporary["reconstructing the elimination system"];
	rec = ReconstructEliminationSystems[elimSyst,"Vector"->True];
	
	PrintTemporary["processing the result"];
	landau = rec // Denominator // Flatten // Apply[PolynomialLCM] // FactorList // Part[#,All,1]& // DeleteCases[x_?NumericQ] // SortBy[ByteCount];
	
	If[OptionValue["AutoDehomogenise"],
		irreds2 = FindIrreducibleMonomials[ideal1//ReplaceAll[kin[[-1]]->0],vars,"MonomialOrder"->DegreeReverseLexicographic];
		If[Or[Length[irreds]=!=Length[irreds2],irreds2===\[Infinity]],
			extraSing = {kin[[-1]]};
		,
			extraSing = {};
		];
		landauh = landau // ReplaceAll[kin[[1;;-2]]->(kin[[1;;-2]]/kin[[-1]])//Thread] // Together // Numerator // Join[#,extraSing]& // SortBy[ByteCount];
	,
		landauh=landau;
	];
	
	(*checking type 2.2 caveats*)
	If[OptionValue["CheckCaveats"],
		Monitor[singularitiesChi = Table[CountSectorsRegulated[gpol,gpolvars,{},"Constraint"->landauh[[i]]],{i,1,landauh//Length}],"checking the Euler characteristic of singularity "<>ToString[i]<>"/"<>ToString[landauh//Length]];
		dropIndex = chiReg > singularitiesChi // Thread;
		spuriousSings = landauh[[Flatten[Position[dropIndex,False]]]];
		genuineSings = landauh[[Flatten[Position[dropIndex,True]]]];
		If[Length[spuriousSings]=!=0,caveatList = Join[caveatList,{"Type 2.2"}];Print["warning: spurious singularities found"]];
		Return[Association["Singularities"->genuineSings,"PossibleCaveats"->caveatList,"SpuriousSingularities"->spuriousSings]];
	,
		Return[Association["Singularities"->landauh]];
	];
];
