echo generating lexer...
time flex -+ language.lex
echo finished generating lexer!

echo compiling lexer...
time g++ lex.yy.cc -o cumulonimbus -std=c++20
echo finished compiling lexer!

time ./cumulonimbus < test.cn
