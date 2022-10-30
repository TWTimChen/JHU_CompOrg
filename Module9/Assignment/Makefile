OBJ=checkCharLogical checkCharNonLogical grading mainMath
LIB=libMath.o
CC=gcc

ALL: $(OBJ)

$(OBJ): %: %.o $(LIB)
	$(CC) $< $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

.PHONY:clean
clean:
	rm -rf $(OBJ) *.o
