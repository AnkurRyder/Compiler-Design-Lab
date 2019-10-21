
# How to Complie the Program

flex q.l
bison -dy q.y
gcc lex.yy.c y.tab.c

## To run on windows

a.exe
