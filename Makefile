# Make-makefiles
# Author: Jaocb Cochran
# File: Makefile
# Last Modified: 2025-02-14
# Purpose: Compile and linke employee.zip files

# Variables
CC = g++
TARGET = employee
CFLAGS = -c -Wall -Wextra

# Default target
all: $(TARGET)

# Linking the object files to create the executable
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)

# Compilation rules for individual object files
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

Supervisor.o: Supervisor.cpp Supervisor.h Employee.h Officer.h
	$(CC) $(CFLAGS) Supervisor.cpp

# Clean target: removes object files, Emacs backups, and the target
clean:
	rm -f *.o $(TARGET) *~

# End of Makefile
