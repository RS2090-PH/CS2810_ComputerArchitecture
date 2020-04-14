
.PHONY: all clean

srcs := $(shell ls *.s)
objs := $(patsubst %.s,%.o,$(srcs))
exec := $(basename $(srcs))

all: $(exec) 

$(exec): %: %.o
	ld -o $@ $<

%.o : %.s
	as -g -o $@ $<

clean:
	rm -f *.o
	rm -f $(exec)
