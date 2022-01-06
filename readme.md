# cumulonimbus
My first attempt at creating my very own language. How crazy!

## Note
This project is a massive work in progress.

## Building
You can use the scripts in the `/scripts/` directory.

## About the language
The language is designed to be very procedural and inflexible so that code is
written in a consistent manner. All types (including primitives) begin with
a capital letter. All identifiers begin with a lowercase letter. Types may be
defined using `typedef` with C-like syntax. There are no objects. Variables
are mutable by default.

### Primitives
- `Int` - a 64-bit signed integer with a range of -9,223,372,036,854,775,808 
  to 9,223,372,036,854,775,807. This is similiar to `long` in C.
- `Bool` - a true or false boolean value.
- `Str` - an immutable set of characters. This is similiar to `char*` in C.
- `Num` - a 64-bit floating point number. This is similiar to `double` in C.
- `Chr` - a single character. This is a 16-bit unsigned number with a range of
  0 to 65,535. 

### Roadmap
- Finish a parser (using Bison)
- Conditional logic
- Expression evaluation
- Arithmetic operations
- Multi-type operations (string + num, etc)
- Casting
- If statements
- While and for loops
- Switch statements
- Returning multiple values
- Custom types (and possibly structs)
- Write an interpreter
- Pointers (asterik and ampersand)
- `out` and `ref` keywords (like those in C#)
- Module/import system
- Standard library
- System-wide package manager
- Detailed error and debugging messages
- Allow for interop with other languages (C, C++, Java, V, and JS to start)
- Just-in-time compilation for interpreted code
- Better type safety
- Advanced debugging features, such as breakpoints
- Write a compiler
- Write an optimizing compiler

### Technologies used

#### Lexing
This project uses Fast Lexical Analyzer Generator (FLEX) to lex source files.

#### Interpreting
This project's primary runtime is written in C++ (for now, at least).
