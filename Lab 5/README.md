# Steps to run Program
- Write the input grammar in file `input-grammar.txt`
- Write the input stream to be validated in file `input.txt`
- Provide appropriate rules for tokenizing in `tokenize.l`
- Complile `tokenize.l` using Lex to generate C program.
- Compile generate C program from Lex using GCC.
- Run `./a.out` to produce tokenize stream of output from provided input in `input.txt`
- Run the Parser Program using `Python3` by following:

```
python script.py < input-grammar.txt
```

The Python3 program expects input grammar from STDIN thus the file `input-grammar.txt` need to be piped to the program.

This program will generate LL(1) grammar from given grammar and write in to file `grammarLL.txt` and the first/follow will be written to file `first-follow.txt`. The program will read tokens from `input.txt` and match it using the generated parsing table and will print the derivation and stack status of each step at STDOUT.