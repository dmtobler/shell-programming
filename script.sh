#!/bin/bash

#SHABANG:
# As seen on line 1, #! followed by path to the interpreter for the script
# Put this on the first line of the shell script in order to avoid complications

# Scripts:
#   Contain a series of commands
#   An interpreter executes commands in the script
#   Anything you can type at the command line, you can put in a script
#   Great for automating tasks

# CHMOD COMMAND:

chmod 755 script.sh

# chmod (short for 'change mode') commands change the access mode of a file.
# Syntax:
#   chmod [reference][operator][mode] file...

# Reference - to whom the permissions apply:
#   u -> Owner -> File's owner
#   g -> Group -> Users who are members of the file's group
#   o -> Others -> Users who are neither the file's owner nor members of the file's group
#   a -> All -> All of the above, same as ugo

# Operator - specify how the modes of a file should be adjusted:
#   + -> Adds mode(s) to specified class(es)
#   - -> Removes specified mode(s) from specified class(es)
#   = -> Mode(s) specified are to be made the exact mode(s) for the specified class(es)

# Mode - what type(s) of permission(s) does the user have on the file:
#   r - Permission to read the file
#   w - Permission to write (or delete) the file
#   x - Permission to execute the file, or, in the case of a directory, search it

# Line 9 shows an alternative bitset format for the chmod command; using binary it
# defines the permissions for the Owner, Group, and Others as shown below:

#   Symbolic:  r-- -w- --x  |  421
#   Binary:    100 010 001  |  -------
#   Decimal:    4   2   1   |  000 = 0
#                           |  001 = 1
#   Symbolic:  rwx r-x r-x  |  010 = 2
#   Binary:    111 101 101  |  011 = 3
#   Decimal:    7   5   5   |  100 = 4
#              /   /   /    |  101 = 5
#   Owner  ---/   /   /     |  110 = 6
#   Group  ------/   /      |  111 = 7
#   Others ---------/       |  Binary to Octal chart

# 755 therefore is giving read, write, execute access to the Owner, and only
# read and execute access to the Group and Others.
# The equivalent syntax would be:
#   chmod rwxr-xr-x script.sh

# ECHO COMMAND:

echo "Scripting is fun!"

# The echo command will simply output whatever follows.

# VARIABLES:

# We can use variables in scripts with the syntax below:
#   VARIABLE_NAME="Value"
# Variables are case-sensitive, and, by convention, variable names are uppercase
# Variable names can contain letters, digits, and underscores -- they can start
# with letters or underscores, but cannot start with a digit

MY_VAR="derp"

# To use the variable, proceed the variable name with a $:

echo "Sometimes I $MY_VAR in the screen."

# If we need to pre- or append data to the variable, encapsulate the variable name
# with curly braces as shown below:

echo "Here's another ${MY_VAR}-able moment."

# ASSIGNING COMMAND OUTPUT TO A VARIABLE:

# To assign command output to a variable, encapsulate the command with parenthesis
# and precede it with a $:

SERVER_NAME=$(hostname)
echo "You are running this script on ${SERVER_NAME}."

# With older scripts, the $() syntax used to be backticks `, as seen below:
#   SERVER_NAME=`hostname`

# TESTS:

# Execute tasks based on different circumstances (e.g. conditional expressions)
# Syntax:
#   [ condition-to-test-for ]

# File operators (tests):
# -d FILE -> True if file is a directory
# -e FILE -> True if file exists
# -f FILE -> True if file exists and is a regular file
# -r FILE -> True if file is readable by you
# -s FILE -> True if file exists and is not empty
# -w FILE -> True if the file is writable by you
# -x FILE -> True if the file is executable by you

[ -e /etc/passwd ]

# String operators (tests):
# -z STRING -> True if string is empty
# -n STRING -> True if string is not empty
# STRING1=STRING2 -> True if the strings are equal
# STRING1!=STRING2 -> True if the strings are not equal

[ -n "I am not empty!" ]
[ "I am the same"="I am different!" ]

# Arithmetic operators (tests):
# arg1 -eq arg2 -> True if arg1 is equal to arg2
# arg1 -ne arg2 -> True if arg2 is not equal to arg2
# arg1 -lt arg2 -> True if arg1 is less than arg2
# arg1 -le arg2 -> True if arg1 is less than or equal to arg2
# arg1 -gt arg2 -> True if arg1 is greater than arg2
# arg1 -ge arg2 -> True if arg1 is greater than or equal to arg2

[ 100 -eq 100 ]
[ 50 -le 100 ]