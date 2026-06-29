(* ::Package:: *)

(* ::Title:: *)
(*Diagram B Singularities*)


If[$Notebooks,SetDirectory[NotebookDirectory[]]];
sectorsB = Import["DIAG_B_external_d.mx"];
sectorsBd4 = Import["DIAG_B_external_4.mx"];


(*Avaibale data*)
sectorsB[[1]] // Keys


(*A graph computed with SPQR*)
sectorsB[[1]]["Graph"]
sectorsB[[1]]["Sector\[Chi]"]
sectorsB[[1]]["Singularities\[Chi]"]
sectorsB[[1]]["Singularities"] // Short
sectorsB[[1]]["Method"]


(*A graph computed with SPQR with d=4*)
sectorsBd4[[1]]["Graph"]
sectorsBd4[[1]]["Sector\[Chi]"]
sectorsBd4[[1]]["Singularities\[Chi]"]
sectorsBd4[[1]]["Singularities"] // Short
sectorsBd4[[1]]["Method"]


(*A graph with dimensional singularities, computed with SOFIA*)
sectorsB[[32]]["Graph"]
sectorsB[[32]]["Sector\[Chi]"]
sectorsB[[32]]["Singularities\[Chi]"]
sectorsB[[32]]["Singularities"]
sectorsB[[32]]["Method"]


(*A graph done with SOFIA simply because it finished in reasonable time*)
sectorsB[[33]]["Graph"]
sectorsB[[33]]["Sector\[Chi]"]
sectorsB[[33]]["Singularities\[Chi]"]
sectorsB[[33]]["Singularities"] // Short
sectorsB[[33]]["Method"]



