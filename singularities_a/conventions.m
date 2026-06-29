(* ::Package:: *)

(* ::Title:: *)
(*Kinematic Conventions for Diagram A*)


(* ::Subsection:: *)
(*Generic dimensional external kinematics*)


replacementRules = {
	p1^2->MM1,
	p1 p2->1/2 (-2 MM1+s12),
	p1 p3->1/2 (2 MM1-s12-s23),
	p1 p4->1/2 (-2 MM1+s23),
	p2^2->MM1,
	p2 p3->1/2 (-2 MM1+s23),
	p2 p4->1/2 (2 MM1-s12-s23),
	p3^2->MM1,
	p3 p4->1/2 (-2 MM1+s12),
	p4^2->MM1
};
