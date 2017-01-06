Rusti
=====

This program is intended for quick execution of a Rust file. It compiles and runs the Rust program using Perl.

Prerequisites
-------------
  * This program only works for `Windows` machines.
  * Make sure Perl6 is installed on the host machine.

Tool Usage
----------
```
    Usage: 
        rusti -[hrt] <argument>
    
    Options:
        -h      Show this screen.
        -r      Remove program after execution.
        -t      Time execution of program.
```

Installation Instructions
-------------------------
  1. Place `rusti.bat` and `rusti.p6` in the Rust `/bin` folder
  2. Create environmental variable `RUST_BIN_PATH` set to the Rust `/bin` folder.
  3. Run `rusti` from the command line.


Note
----
Feel free to contribute, but this project was mainly created for learning purposes.