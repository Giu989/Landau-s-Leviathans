(* ::Package:: *)

(* ::Title:: *)
(*Kinematic Conventions for Diagram B*)


(* ::Subsection:: *)
(*Generic dimensional external kinematics*)


replacementRules = {
	p1^2->0,
	p1 p2->s12/2,
	p1 p3->1/2 (-s12+s123-s23),
	p1 p4->1/2 (-s123+s23-s234+s56),
	p1 p5->1/2 (-s16+s234-s56),
	p1 p6->s16/2,
	p2^2->0,
	p2 p3->s23/2,
	p2 p4->1/2 (-s23+s234-s34),
	p2 p5->1/2 (s16-s234+s34-s345),
	p2 p6->1/2 (-s12-s16+s345),
	p3^2->0,
	p3 p4->s34/2,
	p3 p5->1/2 (-s34+s345-s45),
	p3 p6->1/2 (s12-s123-s345+s45),
	p4^2->0,
	p4 p5->s45/2,
	p4 p6->1/2 (s123-s45-s56),
	p5^2->0,
	p5 p6->s56/2,
	p6^2->0
};


(* ::Subsection:: *)
(*Four dimensional external kinematics*)


replacementRulesd4 = {
	p1^2->0,
	p1 p2->-((-a3 s123+a2 a3 s123-a3^2 s123+a4 s123-a2 a4 s123+a4^2 s123+a1 s234-a2 s234+a1 a4 s234-a2 a4 s234+a2 s345-a3 s345-s56-a1 s56+a2 s56-a3 s56-2 a4 s56-a1 a4 s56+a2 a4 s56-a3 a4 s56-a4^2 s56)/(2 (a2-a3) (-1+a1+a2-a3-a4))),
	p1 p3->(-a1 a2 a3 s123+a2^2 a3 s123-a2^3 a3 s123+a2^2 a3^2 s123+a1 a2 a4 s123-a2^2 a4 s123+a2^3 a4 s123+a1 a3 a4 s123-a2 a3 a4 s123-a1 a2 a3 a4 s123+a2^2 a3 a4 s123-a2 a3^2 a4 s123-a1 a4^2 s123+a2 a4^2 s123+a1 a2 a4^2 s123-2 a2^2 a4^2 s123+a1 a3 a4^2 s123-a1 a4^3 s123+a2 a4^3 s123+a1^2 a2 s234-a1 a2^2 s234-a1 a2 a3 s234+a2^2 a3 s234-a1^2 a4 s234+a1 a2 a4 s234+a1^2 a2 a4 s234-a1 a2^2 a4 s234+a1 a3 a4 s234-a2 a3 a4 s234-a1 a2 a3 a4 s234+a2^2 a3 a4 s234-a1^2 a4^2 s234+a1 a2 a4^2 s234+a1 a3 a4^2 s234-a2 a3 a4^2 s234+a1 a2^2 s345-a1 a2 a3 s345-a2^2 a3 s345+a2 a3^2 s345-a1 a2 a4 s345+a1 a3 a4 s345+a2 a3 a4 s345-a3^2 a4 s345-a1 a2 s56-a1^2 a2 s56+a1 a2^2 s56+a2 a3 s56-a2^2 a3 s56+a2 a3^2 s56+a1 a4 s56+a1^2 a4 s56-a2 a4 s56-2 a1 a2 a4 s56-a1^2 a2 a4 s56+a2^2 a4 s56+a1 a2^2 a4 s56-a1 a3 a4 s56+a2 a3 a4 s56-a2^2 a3 a4 s56+a2 a3^2 a4 s56+2 a1 a4^2 s56+a1^2 a4^2 s56-2 a2 a4^2 s56-a1 a2 a4^2 s56+a2^2 a4^2 s56-a1 a3 a4^2 s56+a1 a4^3 s56-a2 a4^3 s56)/(2 (a1-a2) (a2-a3) (-1+a1+a2-a3-a4) (a3-a4)),
	p1 p4->-((-a1 a3 s123+a2 a3 s123-a2^2 a3 s123-a1 a3^2 s123+a2 a3^2 s123+a1 a4 s123-a2 a4 s123+a2^2 a4 s123+a1 a3 a4 s123-a2 a4^2 s123+a1^2 s234-a1 a2 s234-a1 a3 s234+a1^2 a3 s234+a2 a3 s234-a2^2 a3 s234-a1 a3^2 s234+a2 a3^2 s234-a1 a2 a4 s234+a2^2 a4 s234+a1 a2 s345-a1 a3 s345-a2 a4 s345+a3 a4 s345-a1 s56-a1^2 s56+a1 a2 s56-a1^2 a3 s56-a2 a3 s56+a2^2 a3 s56+a1 a3^2 s56-a2 a3^2 s56-a1 a4 s56+a2 a4 s56+a1 a2 a4 s56-a2^2 a4 s56-a1 a3 a4 s56+a2 a4^2 s56)/(2 (a1-a2) (-1+a1+a2-a3-a4) (a3-a4))),
	p1 p5->-((a1 a2 a3 s123-a1 a2 a4 s123-a1 a3 a4 s123+a1 a4^2 s123-a1 a2 s234+a2^2 s234+a1^2 a4 s234-a1 a2 a4 s234-a1 a3 a4 s234+a2 a3 a4 s234-a2^2 s345+a2 a3 s345+a2 a4 s345-a3 a4 s345+a2 s56+a1 a2 s56-a2^2 s56+a2 a3 s56-a1 a4 s56-a1^2 a4 s56+a2 a4 s56+a1 a2 a4 s56+a1 a3 a4 s56-a1 a4^2 s56)/(2 (a1-a2) (-1+a1+a2-a3-a4))),
	p1 p6->(a1 a2 a3 s123-a1 a2 a4 s123-a1 a3 a4 s123+a1 a4^2 s123-a1 s234+a1^2 s234+a2 s234-a1 a2 s234-a1 a3 s234+a2 a3 s234-a1 a4 s234+a1^2 a4 s234+a2 a4 s234-a1 a2 a4 s234-a1 a3 a4 s234+a2 a3 a4 s234-a2^2 s345+a2 a3 s345+a2 a4 s345-a3 a4 s345+a1 s56-a1^2 s56+a1 a2 s56+a1 a3 s56-a1^2 a4 s56+a1 a2 a4 s56+a1 a3 a4 s56-a1 a4^2 s56)/(2 (a1-a2) (-1+a1+a2-a3-a4)),
	p2^2->0,
	p2 p3->(a1^2 a3 s123-a1^2 a4 s123-a1 a3 a4 s123+a1 a4^2 s123-a1^2 s234+a1 a2 s234+a1 a4 s234-a1^2 a4 s234-a2 a4 s234+a1 a2 a4 s234+a1 a4^2 s234-a2 a4^2 s234-a1 a2 s345+a1 a3 s345+a2 a4 s345-a3 a4 s345+a1 s56+a1^2 s56-a1 a2 s56+a1 a3 s56+a1^2 a4 s56-a1 a2 a4 s56+a1 a3 a4 s56-a1 a4^2 s56)/(2 (a1-a2) (-1+a1+a2-a3-a4) (a3-a4)),
	p2 p4->(-a1^2 a2 a3 s123+a1 a2 a3^2 s123+a1^2 a2 a4 s123+a1^2 a3 a4 s123-a1 a2 a3 a4 s123-a1 a3^2 a4 s123-a1^2 a4^2 s123+a1 a3 a4^2 s123+a1^2 a2 s234-a1 a2^2 s234-a1^2 a3 s234+a1^3 a3 s234+a2^2 a3 s234-a1 a2^2 a3 s234+a1 a3^2 s234-2 a1^2 a3^2 s234-a2 a3^2 s234+a1 a2 a3^2 s234+a2^2 a3^2 s234+a1 a3^3 s234-a2 a3^3 s234-a1^3 a4 s234+a1^2 a2 a4 s234+a1^2 a3 a4 s234-a1 a2 a3 a4 s234+a1 a2^2 s345-a1 a2 a3 s345-a2^2 a3 s345+a2 a3^2 s345-a1 a2 a4 s345+a1 a3 a4 s345+a2 a3 a4 s345-a3^2 a4 s345-a1 a2 s56-a1^2 a2 s56+a1 a2^2 s56+a1 a3 s56-a1^3 a3 s56-a1 a2 a3 s56+a1 a2^2 a3 s56+a1 a3^2 s56+a1^2 a3^2 s56-a1 a2 a3^2 s56+a1^2 a4 s56+a1^3 a4 s56-a1 a2 a4 s56-a1^2 a2 a4 s56-a1^2 a3 a4 s56+a1 a3^2 a4 s56+a1^2 a4^2 s56-a1 a3 a4^2 s56)/(2 (a1-a2) (a2-a3) (-1+a1+a2-a3-a4) (a3-a4)),
	p2 p5->-((-a1^2 a3 s123+a1 a2 a3 s123-a1 a2^2 a3 s123+a1 a2 a3^2 s123+a1^2 a4 s123-a1 a2 a4 s123+a1 a2^2 a4 s123-a1 a3^2 a4 s123-a1 a2 a4^2 s123+a1 a3 a4^2 s123+a1^3 s234-a1^2 a2 s234-a1^2 a3 s234+a1 a2 a3 s234-a1^2 a2 a4 s234+a1 a2^2 a4 s234+a1^2 a3 a4 s234-a2^2 a3 a4 s234-a1 a3^2 a4 s234+a2 a3^2 a4 s234+a1^2 a2 s345-a1^2 a3 s345-a1 a2 a3 s345+a1 a3^2 s345-a1 a2 a4 s345+a1 a3 a4 s345+a2 a3 a4 s345-a3^2 a4 s345-a1^2 s56-a1^3 s56+a1^2 a2 s56+a1 a3 s56-a1 a2 a3 s56+a1 a3^2 s56-a1^2 a4 s56+a1 a2 a4 s56+a1^2 a2 a4 s56-a1 a2^2 a4 s56-a1^2 a3 a4 s56+a1 a3^2 a4 s56+a1 a2 a4^2 s56-a1 a3 a4^2 s56)/(2 (a1-a2) (a2-a3) (-1+a1+a2-a3-a4))),p2 p6->-((a1 a3 s123-a2 a3 s123-a1 a2 a3 s123+a2^2 a3 s123+a1 a2^2 a3 s123+a1 a3^2 s123-a2 a3^2 s123-a1 a2 a3^2 s123-a1 a4 s123+a2 a4 s123+a1 a2 a4 s123-a2^2 a4 s123-a1 a2^2 a4 s123+a1 a3^2 a4 s123-a1 a4^2 s123+a2 a4^2 s123+a1 a2 a4^2 s123-a1 a3 a4^2 s123-a1^2 s234+a1 a2 s234+a1^2 a2 s234-a1 a2^2 s234+a1 a3 s234-a1^2 a3 s234-a2 a3 s234+a2^2 a3 s234+a1 a3^2 s234-a2 a3^2 s234-a1^2 a4 s234+a1 a2 a4 s234+a1^2 a2 a4 s234-a1 a2^2 a4 s234+a1 a3 a4 s234-a1^2 a3 a4 s234-a2 a3 a4 s234+a2^2 a3 a4 s234+a1 a3^2 a4 s234-a2 a3^2 a4 s234-a1^2 a2 s345+a1^2 a3 s345+a1 a2 a3 s345-a1 a3^2 s345+a1 a2 a4 s345-a1 a3 a4 s345-a2 a3 a4 s345+a3^2 a4 s345+a1 s56+a1^2 s56-a2 s56-a1 a2 s56-a1^2 a2 s56+a2^2 s56+a1 a2^2 s56+a1^2 a3 s56-a2 a3 s56-a1 a3^2 s56+2 a1 a4 s56+a1^2 a4 s56-2 a2 a4 s56-2 a1 a2 a4 s56-a1^2 a2 a4 s56+a2^2 a4 s56+a1 a2^2 a4 s56+a1 a3 a4 s56+a1^2 a3 a4 s56-a2 a3 a4 s56-a1 a3^2 a4 s56+a1 a4^2 s56-a2 a4^2 s56-a1 a2 a4^2 s56+a1 a3 a4^2 s56)/(2 (a1-a2) (a2-a3) (-1+a1+a2-a3-a4))),
	p3^2->0,
	p3 p4->(a1 a3 s123-a1 a4 s123-a1^2 s234+a2^2 s234+a1 a3 s234-a2 a3 s234-a2 s345+a3 s345+a1 s56+a1^2 s56+a1 a2 s56-a1 a3 s56+a1 a4 s56)/(2 (a2-a3) (-1+a1+a2-a3-a4)),
	p3 p5->(-a1 a2 a3 s123+a1 a2^2 a3 s123-a1 a2 a3^2 s123+a1 a2 a4 s123-a1 a2^2 a4 s123+a1 a3 a4 s123+a1 a3^2 a4 s123-a1 a4^2 s123+a1 a2 a4^2 s123-a1 a3 a4^2 s123+a1^2 a2 s234-a1 a2^2 s234-a1^2 a4 s234+a1^2 a2 a4 s234+a2^2 a4 s234-a1 a2^2 a4 s234+a1 a3 a4 s234-a1^2 a3 a4 s234-a2 a3 a4 s234+a2^2 a3 a4 s234+a1 a3^2 a4 s234-a2 a3^2 a4 s234+a1 a2^2 s345-a1 a2 a3 s345-a1 a2 a4 s345-a2^2 a4 s345+a1 a3 a4 s345+a2 a3 a4 s345+a2 a4^2 s345-a3 a4^2 s345-a1 a2 s56-a1^2 a2 s56+a1 a2^2 s56-a1 a2 a3 s56+a1 a4 s56+a1^2 a4 s56-a1 a2 a4 s56-a1^2 a2 a4 s56+a1 a2^2 a4 s56+a1^2 a3 a4 s56-a1 a3^2 a4 s56+a1 a4^2 s56-a1 a2 a4^2 s56+a1 a3 a4^2 s56)/(2 (a2-a3) (-1+a1+a2-a3-a4) (a3-a4)),
	p3 p6->-((-a2 a3 s123+a2^2 a3 s123+a1 a2^2 a3 s123-a2 a3^2 s123-a1 a2 a3^2 s123+a2 a4 s123-a2^2 a4 s123-a1 a2^2 a4 s123+a3 a4 s123-a2 a3 a4 s123+a3^2 a4 s123+a1 a3^2 a4 s123-a4^2 s123+2 a2 a4^2 s123+a1 a2 a4^2 s123-a1 a3 a4^2 s123-a4^3 s123+a1^2 a2 s234-a1 a2^2 s234+a1 a3 s234-a1^2 a3 s234-a2 a3 s234+a2^2 a3 s234+a1 a3^2 s234-a2 a3^2 s234-a1 a4 s234+a2 a4 s234+a1^2 a2 a4 s234-a1 a2^2 a4 s234+a1 a3 a4 s234-a1^2 a3 a4 s234-a2 a3 a4 s234+a2^2 a3 a4 s234+a1 a3^2 a4 s234-a2 a3^2 a4 s234-a1 a4^2 s234+a2 a4^2 s234+a1 a2^2 s345-a1 a2 a3 s345-a1 a2 a4 s345-a2^2 a4 s345+a1 a3 a4 s345+a2 a3 a4 s345+a2 a4^2 s345-a3 a4^2 s345-a1 a2 s56-a1^2 a2 s56+a1 a2^2 s56-a3 s56+a1^2 a3 s56+a2 a3 s56-a3^2 s56-a1 a3^2 s56+a4 s56+a1 a4 s56-a2 a4 s56-2 a1 a2 a4 s56-a1^2 a2 a4 s56+a1 a2^2 a4 s56-a3 a4 s56+a1 a3 a4 s56+a1^2 a3 a4 s56+a2 a3 a4 s56-a3^2 a4 s56-a1 a3^2 a4 s56+2 a4^2 s56+a1 a4^2 s56-a2 a4^2 s56-a1 a2 a4^2 s56+a1 a3 a4^2 s56+a4^3 s56)/(2 (a2-a3) (-1+a1+a2-a3-a4) (a3-a4))),
	p4^2->0,
	p4 p5->-((-a1 a3 s123+a1 a2 a3 s123+a1 a4 s123-a1 a2 a4 s123-a1 a3 a4 s123+a1 a4^2 s123+a1^2 s234-a1 a2 s234-a1 a3 s234+a2 a3 s234+a1^2 a4 s234-a1 a2 a4 s234-a1 a3 a4 s234+a2 a3 a4 s234+a1 a2 s345-a1 a3 s345-a2 a3 s345+a3^2 s345-a1 s56-a1^2 s56+a1 a2 s56+a1 a3 s56-2 a1 a4 s56-a1^2 a4 s56+a1 a2 a4 s56+a1 a3 a4 s56-a1 a4^2 s56)/(2 (-1+a1+a2-a3-a4) (a3-a4))),
	p4 p6->-((a3 s123-a2 a3 s123-a1 a2 a3 s123+a3^2 s123-a4 s123+a2 a4 s123+a1 a2 a4 s123+a1 a3 a4 s123-a4^2 s123-a1 a4^2 s123-a1^2 s234+a1 a2 s234+a1 a3 s234-a2 a3 s234-a1^2 a4 s234+a1 a2 a4 s234+a1 a3 a4 s234-a2 a3 a4 s234-a1 a2 s345+a1 a3 s345+a2 a3 s345-a3^2 s345+a1 s56+a1^2 s56-a1 a2 s56-a3 s56+a2 a3 s56-a3^2 s56+a4 s56+a1 a4 s56+a1^2 a4 s56-a2 a4 s56-a1 a2 a4 s56-a1 a3 a4 s56+a4^2 s56+a1 a4^2 s56)/(2 (-1+a1+a2-a3-a4) (a3-a4))),
	p5^2->0,
	p5 p6->s56/2,
	p6^2->0
};
