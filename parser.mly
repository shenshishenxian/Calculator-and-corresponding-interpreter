%{ open Ast %}

%token PLUS MINUS TIMES DIVIDE EOF
%token <int> LITERAL 
%token SEMICOLON
%token EQUAL
%token <int> VARIABLE
%left SEMICOLON
%left EQUAL
%left PLUS MINUS
%left TIMES DIVIDE 
%start expr
%type <Ast.expr> expr

%%


expr:
expr PLUS expr { Binop($1, Add, $3) }
| expr SEMICOLON expr { Seq ($1, $3)}
| VARIABLE EQUAL expr { Asn ($1, $3)}
| VARIABLE { Var ($1)}
| expr MINUS expr { Binop($1, Sub, $3) } 
| expr TIMES expr { Binop($1, Mul, $3) } 
| expr DIVIDE expr { Binop($1, Div, $3) } 
| LITERAL { Lit($1) }
 