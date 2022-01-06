%require "3.2"
%language "c++"

%{
    #include <vector>
    #include <iostream>

    using std::vector;
    using std::string;
    using std::cout;
    using std::endl;
    using std::to_string;
    using std::ostream;
    using std::cerr;
%}

%code {
}

%union {
    int int_val;
    double num_val;
    string str_val;
    bool bool_val;
}

%nterm<string> item;
%token<string> TEXT;
%token<int> NUMBER;
%token<int_val> T_INT;
%token<num_val> T_NUM;
%token<str_val> T_STR;
%token<bool_val> T_BOOL;
%token T_PLUS
%token T_MINUS
%token T_MULTIPLY
%token T_DIVIDE
%token T_LEFT
%token T_RIGHT
%token T_NEWLINE
%token T_QUIT
%left T_PLUS
%left T_MINUS
%left T_MULTIPLY
%left T_DIVIDE

%%
calculation:
           | calculation line
;

line: T_NEWLINE
    | mixed_expression T_NEWLINE { }
    | expression T_NEWLINE { }
    | T_QUIT T_NEWLINE { }
%%

int main() {
}


