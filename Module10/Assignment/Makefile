OBJ= guessNumber checkPrime
CC=gcc

ALL: $(OBJ)

$(OBJ): %: %.o
	$(CC) $< $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

.PHONY:clean
clean:
	rm -rf $(OBJ) *.o
