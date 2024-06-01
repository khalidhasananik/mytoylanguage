%option noyywrap

%{
#include "parser.tab.h"
void yyerror(const char *s);
%}

%%

[ \t]                   ;  // Ignore whitespace
\n                      { return EOL; }
[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; }
"+"                     { return ADD; }
"-"                     { return SUB; }
"*"                     { return MUL; }
"/"                     { return DIV; }
"="                     { return ASSIGN; }
"print"                 { return PRINT; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = strdup(yytext); return IDENTIFIER; }
.                       { yyerror("Unexpected character"); }

%%
