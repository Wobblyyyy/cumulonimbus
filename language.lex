%{
    #include "lexer.c"
    // #include "lexer.cc"

    enum TOKEN_TYPE {
        IF,
        ELSE,
        SWITCH,
        BREAK,
        CASE,
        WHILE,
        FOR,
        TYPEDEF,
        FN,
        OPEN_BRACE,
        CLOSE_BRACE,
        OPEN_SQUARE,
        CLOSE_SQUARE,
        OPEN_CURLY,
        CLOSE_CURLY
    };
%}

INTEGER [+-]?[0-9]*
NUMBER [+-]?[1-9]*\.[1-9]*
KEYWORD if|else|switch|break|case|while|for|typedef|fn
IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
TYPE [A-Z][a-zA-Z0-9]*
STRING_LITERAL \".*\"

%%
{NUMBER} {
    printf("(num: '%s')", yytext);
}

{INTEGER} {
    printf("(int: '%s')", yytext);
}

{KEYWORD} {
    printf("(kw: '%s')", yytext);
}

{TYPE} {
    printf("(type: '%s')", yytext);
}

{STRING_LITERAL} {
    printf("(str: '%s')", yytext);
}

{IDENTIFIER} {
    printf("(id: '%s')", yytext);
}
%%

void init() {
}

void finish() {
}

int yywrap() { }

int main() {
    init();
    yylex();
    lexer__do_cool_stuff();
    finish();
    return 0;
}

