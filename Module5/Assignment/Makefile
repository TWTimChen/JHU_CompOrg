objects = hw-1-1 hw-1-2 hw-2 hw-3 hw-4
CC = gcc
CFLAGS = -g

all: $(objects)
$(objects): %: %.s
	$(CC) $(CFLAGS) -o $@ $<


.PHONY:clean
clean:
	rm -rf $(objects)
