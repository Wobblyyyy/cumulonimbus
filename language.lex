%option c++
%option noyywrap

%{
    #define PARSE_ERROR 100
    // #include <regex>
    #include <iostream>
    #include <vector>

    using std::vector;
    using std::string;
    using std::cout;
    using std::endl;
    using std::exception;

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
        TRUE,
        FALSE,
        RETURN,
        OPEN_BRACE,
        CLOSE_BRACE,
        OPEN_SQUARE,
        CLOSE_SQUARE,
        OPEN_CURLY,
        CLOSE_CURLY,
        OP_PLUS,
        OP_MINUS,
        OP_DIVIDE,
        OP_MULTIPLY,
        OP_ASSIGN,
        OP_EQUALS,
        OP_NOT_EQUALS,
        OP_AND,
        OP_OR,
        OP_GREATER_THAN,
        OP_LESS_THAN,
        OP_GREATER_THAN_OR_EQUAL_TO,
        OP_LESS_THAN_OR_EQUAL_TO,
        STR_LITERAL,
        INT_LITERAL,
        NUM_LITERAL,
        TYPE,
        IDENTIFIER,
        STATEMENT_END,
        NONE
    };

    vector<string> str_vec = { };
    vector<TOKEN_TYPE> type_vec = { };

    string convert_type(TOKEN_TYPE type) {
        switch (type) {
            case IF: return "i";
            case ELSE: return "e";
            case SWITCH: return "s";
            case BREAK: return "b";
            case CASE: return "c";
            case WHILE: return "w";
            case FOR: return "f";
            case TYPEDEF: return "T";
            case FN: return "F";
            case TRUE: return "Y";
            case FALSE: return "N";
            case RETURN: return "r";
            case OPEN_BRACE: return "(";
            case CLOSE_BRACE: return ")";
            case OPEN_SQUARE: return "[";
            case CLOSE_SQUARE: return "]";
            case OPEN_CURLY: return "{";
            case CLOSE_CURLY: return "}";
            case OP_PLUS: return "+";
            case OP_MINUS: return "-";
            case OP_DIVIDE: return "/";
            case OP_MULTIPLY: return "x";
            case OP_ASSIGN: return "=";
            case OP_EQUALS: return "E";
            case OP_NOT_EQUALS: return "Z";
            case OP_AND: return "&";
            case OP_OR: return "|";
            case OP_GREATER_THAN: return ">";
            case OP_LESS_THAN: return "<";
            case OP_GREATER_THAN_OR_EQUAL_TO: return "G";
            case OP_LESS_THAN_OR_EQUAL_TO: return "L";
            case STR_LITERAL: return "st";
            case INT_LITERAL: return "in";
            case NUM_LITERAL: return "nm";
            case TYPE: return "tp";
            case IDENTIFIER: return "id";
            case STATEMENT_END: return "!";
            default: return "";
        }
    }

    void push_back_vecs(string str, TOKEN_TYPE type) {
        str_vec.push_back(str);
        type_vec.push_back(type);
    }
%}

INTEGER [+-]?[0-9]+
NUMBER [+-]?[1-9]*\.[1-9]*
KEYWORD if|else|switch|break|case|while|for|typedef|fn|true|false|return
IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
TYPE [A-Z][a-zA-Z0-9]*
STRING_LITERAL \".*\"
STATEMENT_END ;
OP \=\=|\=|\&\&|\|\||[\+\-\*\/]|\+\+|\-\-|\!\=|\<|\>|\>\=|\<\=
BRACE [\(\)\[\]\{\}]

%%
{NUMBER} {
    printf("(num: '%s')", yytext);
    push_back_vecs(yytext, TOKEN_TYPE::NUM_LITERAL);
}

{INTEGER} {
    printf("(int: '%s')", yytext);
    push_back_vecs(yytext, TOKEN_TYPE::INT_LITERAL);
}

{KEYWORD} {
    printf("(kw: '%s')", yytext);
    using enum TOKEN_TYPE;
    TOKEN_TYPE tok;
    if (strcmp(yytext, "if") == 0) {
        tok = IF;
    } else if (strcmp(yytext, "else") == 0) {
        tok = ELSE;
    } else if (strcmp(yytext, "switch") == 0) {
        tok = SWITCH;
    } else if (strcmp(yytext, "break") == 0) {
        tok = BREAK;
    } else if (strcmp(yytext, "case") == 0) {
        tok = CASE;
    } else if (strcmp(yytext, "while") == 0) {
        tok = WHILE;
    } else if (strcmp(yytext, "for") == 0) {
        tok = FOR;
    } else if (strcmp(yytext, "typedef") == 0) {
        tok = TYPEDEF;
    } else if (strcmp(yytext, "fn") == 0) {
        tok = FN;
    } else if (strcmp(yytext, "true") == 0) {
        tok = TRUE;
    } else if (strcmp(yytext, "false") == 0) {
        tok = FALSE;
    } else if (strcmp(yytext, "return") == 0) {
        tok = RETURN;
    }
    push_back_vecs(yytext, tok);
}

{TYPE} {
    printf("(type: '%s')", yytext);
    push_back_vecs(yytext, TOKEN_TYPE::TYPE);
}

{STRING_LITERAL} {
    printf("(str: '%s')", yytext);
    push_back_vecs(yytext, TOKEN_TYPE::STR_LITERAL);
}

{IDENTIFIER} {
    printf("(id: '%s')", yytext);
    push_back_vecs(yytext, TOKEN_TYPE::IDENTIFIER);
}

{OP} {
    printf("(%s)", yytext);
    using enum TOKEN_TYPE;
    TOKEN_TYPE tok;
    if (strcmp(yytext, "+") == 0) {
        tok = OP_PLUS;
    } else if (strcmp(yytext, "-") == 0) {
        tok = OP_MINUS;
    } else if (strcmp(yytext, "*") == 0) {
        tok = OP_MULTIPLY;
    } else if (strcmp(yytext, "/") == 0) {
        tok = OP_DIVIDE;
    } else if (strcmp(yytext, "<=") == 0) {
        tok = OP_LESS_THAN_OR_EQUAL_TO;
    } else if (strcmp(yytext, ">=") == 0) {
        tok = OP_GREATER_THAN_OR_EQUAL_TO;
    } else if (strcmp(yytext, "==") == 0) {
        tok = OP_EQUALS;
    } else if (strcmp(yytext, "!=") == 0) {
        tok = OP_NOT_EQUALS;
    } else if (yytext == "<") {
        tok = OP_LESS_THAN;
    } else if (yytext == ">") {
        tok = OP_GREATER_THAN;
    }
    push_back_vecs(yytext, tok);
}

{STATEMENT_END} {
    printf("(;)");
    push_back_vecs(yytext, TOKEN_TYPE::STATEMENT_END);
}

{BRACE} {
    /*
    if (regex_match(yytext, regex("[\(\[\{]"))) {
        printf("!%s", yytext);
    } else {
        printf("%s!", yytext);
    }
    */
    printf("%s", yytext);
    using enum TOKEN_TYPE;
    TOKEN_TYPE tok;
    if (yytext == "(") {
        tok = OPEN_BRACE;
    } else if (yytext == ")") {
        tok = CLOSE_BRACE;
    } else if (yytext == "[") {
        tok = OPEN_SQUARE;
    } else if (yytext == "]") {
        tok = CLOSE_SQUARE;
    } else if (yytext == "{") {
        tok = OPEN_CURLY;
    } else if (yytext == "}") {
        tok = CLOSE_CURLY;
    }
    push_back_vecs(yytext, tok);
}
%%

void init() {
    return;
}

void finish() {
    return;
}

int yywrap() {
    return 0;
}

void parse_data() {
    yyFlexLexer *lexer = new yyFlexLexer();
    lexer->yylex();
    for (int i = 0; i < str_vec.size(); i++) {
        TOKEN_TYPE type = type_vec[i];
        string converted = convert_type(type);
        if (converted != "") {
            if (converted.length() == 1) {
                cout << converted;
            } else {
                cout << converted << "," << str_vec[i] << ";";
            }
        } else {
            cout << str_vec[i];
        }
    }
}

int main() {
    init();
    parse_data();
    finish();
    return 0;
}

