# compile the v backend
v -shared -o lexer.c lexer.v

# generate the lexer
# flex language.lex
flex language.lex

# generate an executable
# gcc lex.yy.c -o cumulonimbus
g++ lex.yy.c -o cumulonimbus

# execute it
./cumulonimbus < test.cn
