#!/bin/bash

# A simple wrapper script to run a program in a new terminal and keep it open.

# Run the program passed as an argument
"$@"

# Keep the terminal open until the user presses Enter
read -p "Press Enter to exit..."