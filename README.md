# Calculator-and-corresponding-interpreter
This repository contains OCaml code of a word frequency counter and a calculator. And there is a interpreter associated with it. Basically, this is a warm up for the whole programming language design.

Run the code in following steps.

ocamllex scanner.mll 
ocamlyacc parser.mly 
ocamlc -c ast.mli
ocamlc -c parser.mli 
ocamlc -c scanner.ml
ocamlc -c parser.ml
ocamlc -c calc.ml 
ocamlc -o calc parser.cmo scanner.cmo calc.cmo
./calc

Then you will be able to use the calculator.
Example input:

a = 5; b = c = 6; a * b + c
Should return 36
