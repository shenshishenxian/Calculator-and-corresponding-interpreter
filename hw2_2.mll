{ type token = EOF | Word of string}

rule token = parse
	| eof {EOF}
	| ['a'-'z' 'A'-'Z']+ as word{Word(word)}
	| _ {token lexbuf}

{	
	module StringMap = Map.Make(String);;
	let lexbuf = Lexing.from_channel stdin in
	let wordlist =
		let rec next l =
			match token lexbuf with
				EOF -> l
			| Word(s) -> next (s::l)
		in next []
	in
	let succs = List.fold_left
			(fun map s -> StringMap.add s 0 map) StringMap.empty wordlist
	in
	let succs = List.fold_left
			(fun succs s -> 
				let ss  = 1 + StringMap.find s succs 
				in StringMap.add s ss succs) succs wordlist
	in
	let lss = StringMap.fold(fun w c newlist -> (c,w)::newlist) succs []
	in
	let wordcounts = List.sort(fun(c1,_)(c2,_) -> Pervasives.compare c2 c1) lss
	in 

	List.iter (fun (a,b) -> print_int a; print_string " "; print_endline b) wordcounts 

	
}