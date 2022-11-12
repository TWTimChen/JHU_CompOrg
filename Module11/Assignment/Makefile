OBJ= mult fib
CC=gcc

ALL: $(OBJ)

$(OBJ): %: %.o
	$(CC) $< -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

.PHONY:clean
clean:
	rm -rf $(OBJ) *.o
