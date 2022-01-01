# In order to execute this Makefile just type "make"
OBJS = # objects files (.o) goes here (e.g : main.o list.o hash.o)
SOURCE = # sources files (.c) goes here (e.g : main.c list.c hash.c)
HEADER = # headers files (.h) goes here (e.g : header.h list.h hash.h)
PROGRAM = # the name you want the executable to have (e.g : exe)
CC = # compiler goes here (e.g gcc / g++) 
CFLAGS = # compilation flags goes here (e.g : -Wall -W)
# -Wall turn on all warnings, -W turn on more warnings
DEBUGER = # -g3 or empty if you dont want to debug your program

$(PROGRAM): clean $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ 
	# $@ : current target

# create and compile the individual files
# for every object file you have:
nameOfObjectFile.o: nameOfSourceFileThatTheObjectFileNeeds.c # all the files, the object file needs to be created
	$(CC) $(DEBUGER) $(CFLAGS) -c $? 
	# $? : current list of prerequisites

# to execute this just type "make clean"
clean: # removes the object files and the executable
	rm -f $(OBJS) $(PROGRAM)
	
# to execute this just type "make run"
run: # run your program
	./$(PROGRAM)
	
# to execute this just type "make val"
val: # run your programm with valgrind to check for memory leaks and errors
	valgrind --leak-check=full -v ./$(PROGRAM)

# to execute this just type "make debug"
debug: # run your program with gdb to debug it, you should have ~! DEBUGER = -g3 !~
	gdb ./$(PROGRAM)
	
	# Usefull comands for gdb : 
	#			run program_arguments or < file_name----------> to run your program
	#			backtrace or bt-------------------------------> print all active (not finished) function calls in the calling stack,
	#									the most recent call is at the top, #X at the beginning of each line 
	#							    	    	is the position in the stack (0 == top), press enter for more
	#			backtrace full--------------------------------> same with backtrace / bt but shows the values of each local variable as well
	#			break or b------------------------------------> pause execution at certain program points (breakpoints),
	#								    	pause before executing the command at that point,
	#								    	wait there for user commands, 
	#								    		break fun1 → break at start of function “fun1”
	#								    		break 10 → break at line 10 (if one file only)
	#								    		break t1.c:5 → break at line 5 of file “t1.c”
	#			next or n-------------------------------------> after a breakpoint, execute the next program instruction,
	#								    	executes the whole function call
	#			step or s-------------------------------------> after a breakpoint, execute the next program instruction,
	#								    	goes inside the function and waits for more commands
	#			finish or f-----------------------------------> executes current function until it returns and then waits
	#			continue or c---------------------------------> run without a pause until the next breakpoint
	#			quit or q-------------------------------------> terminate gdb
	#			print or p------------------------------------> print the current value of a program expression
	#									an expression can be simple (e.g., variables, etc)
	#									or complicated (e.g., function calls)
	#			frame #number---------------------------------> move to position #number in the calling stack
	#	   ~! if something is 0x0 it means it is NULL !~

# to execute this just type "make count"
count: # counts the words of the source and header files
	wc $(SOURCE) $(HEADER)
