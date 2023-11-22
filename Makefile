all: lexico compilar yacc

lexico: esp_lexica.l
	flex -l esp_lexica.l

compilar: lex.yy.c
	gcc -o practica2 lex.yy.c

ejecutar: practica2
	./practica2 < $(nombre)
yacc: 
	bison -t -v -d esp_sint.y
clean:
	rm practica1 lex.yy.c
