all : asm

asm: lekser.l parser.ypp
	bison -d parser.ypp
	flex lekser.l
	g++ -o asembler test.cpp parser.cpp lex.yy.c -lfl 

clean:
	rm -f parser.cpp parser.hpp test_parser lex.yy.c