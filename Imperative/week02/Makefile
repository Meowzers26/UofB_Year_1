OPTIONS = -std=c11 -Wall -pedantic -g
END		= -fsanitize=undefined -fsanitize=address

# Find the OS platform using the uname command.
Linux := $(findstring Linux, $(shell uname -s))
MacOS := $(findstring Darwin, $(shell uname -s))
Windows := $(findstring NT, $(shell uname -s))

# For native Windows only (not supported in our unit), add the .exe extension
ifdef Windows

hello: hello.c
	clang -std=c11 -Wall -pedantic -g hello.c -o hello.exe

# For Linux/MacOS/LinuxSubSystemForWindows10, include the advanced debugging options
else

hello: hello.c
	clang $(OPTIONS) hello.c -o hello $(END)
	./hello

.PHONY: fullpaint
fullpaint:
	clang $(OPTIONS) fullpaint.c -o fullpaint $(END)
	./fullpaint

.PHONY: square
square:
	clang $(OPTIONS) square.c -o square $(END)
	./square

endif