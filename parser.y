%{
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <map>
#include <string>

std::map<std::string, int> symbol_table; // Symbol table to store variable values

extern int yylex();
void yyerror(const char *s) {
    std::cerr << "Error: " << s << std::endl;
}

int yywrap() {
    return 1;
}

int yyparse();

int main() {
    std::cout << "Starting the parser..." << std::endl;
    return yyparse();
}
%}

%union {
    int num;        // For numbers
    char* str;      // For identifiers
}

%token <num> NUMBER
%token <str> IDENTIFIER
%token EOL ADD SUB MUL DIV ASSIGN PRINT

%type <num> expression

%start program

// Define operator precedence (lower to higher)
%right ASSIGN
%left ADD SUB
%left MUL DIV

%%

program:
    | program statement EOL { }
    ;

statement:
      IDENTIFIER ASSIGN expression { symbol_table[$1] = $3; std::cout << $1 << " = " << symbol_table[$1] << std::endl; }
    | PRINT expression           { std::cout << $2 << std::endl; }
    ;

expression:
      NUMBER                     { $$ = $1; }
    | IDENTIFIER                 { 
                                    if (symbol_table.find($1) != symbol_table.end()) {
                                        $$ = symbol_table[$1]; 
                                    } else {
                                        yyerror("Variable not defined.");
                                    }
                                  }
    | expression ADD expression  { $$ = $1 + $3; }
    | expression SUB expression  { $$ = $1 - $3; }
    | expression MUL expression  { $$ = $1 * $3; }
    | expression DIV expression  { if ($3) $$ = $1 / $3; else yyerror("Division by zero."); }
    ;

%%
