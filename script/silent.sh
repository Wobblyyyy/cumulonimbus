echo generating lexer...
time flex -+ language.lex
echo finished generating lexer!

echo compiling lexer...
time g++ lex.yy.cc -o cumulonimbus
echo finished compiling lexer!
