package analizadorlexico;
import static analizadorlexico.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
letter |
text |
bool |
num |
Dnum |
if |
arr |
else |
for |
and |
or |
publica |
privada |
estatico |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"[+]" {return Suma;}
"[-]" {return Resta;}
"[*]" {return Multiplicacion;}
"[/]" {return Division;}
";" {lexeme=yytext(); return Delimitador;}
"++" {lexeme=yytext(); return Incremento;}
"(" |
")" |
"{" |
"}" {lexeme=yytext(); return Separador;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
