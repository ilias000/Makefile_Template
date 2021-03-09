# In order to execute this Makefile just type "make"
OBJS = # objects files (.o) goes here (e.g : main.o list.o hash.o)
SOURCE = # sources files (.c) goes here (e.g : main.c list.c hash.c)
HEADER = # headers files (.h) goes here (e.g : header.h list.h hash.h)
PROGRAM = # the name you want the executable to have (e.g : exe)
CC = # compiler goes here (e.g gcc) 
CFLAGS = # compilation flags goes here (e.g : -Wall -g)
# -Wall turn on all warnings, -g for debugging mod

$(PROGRAM): clean $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ 
	# $@ : current target

# create and compile the individual files in
# for every object file you have:
nameOfObjectFile.o: nameOfSourceFileThatTheObjectFileNeeds.c # all the files, the object file needs to be created
	$(CC) $(CFLAGS) $? 
	# $? : current list of prerequisites

clean:
	rm -f $(OBJS) $(PROGRAM)
	# removes the object files and the executable
	# to execute this just type "make clean"

count:
	wc $(SOURCE) $(HEADER)
	# counts the words of the source and header files
	# to execute this just type "make count"