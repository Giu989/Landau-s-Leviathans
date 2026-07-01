(* ::Package:: *)

(* ::Title:: *)
(*Diagram A Singularities*)


If[$Notebooks,SetDirectory[NotebookDirectory[]]];
sectorsA = Import["DIAG_A.mx"];


(*Avaibale data*)
sectorsA[[1]] // Keys


(*A graph computed with SPQR*)
sectorsA[[1]]["Graph"]
sectorsA[[1]]["Sector\[Chi]"]
sectorsA[[1]]["Singularities\[Chi]"]
sectorsA[[1]]["Singularities"] // Short
sectorsA[[1]]["Method"]


(*A graph computed with SPQR and simple indeterminate singularities identified with SOFIA*)
sectorsA[[2]]["Graph"]
sectorsA[[2]]["Sector\[Chi]"]
sectorsA[[2]]["Singularities\[Chi]"]
sectorsA[[2]]["Singularities"]
sectorsA[[2]]["Method"]


(*Note that tadpoles are not drawn*)
sectorsA[[-4]]["Graph"][[1]]
