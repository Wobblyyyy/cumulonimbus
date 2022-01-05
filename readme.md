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
- `Int`
- `Bool`
- `Str`
- `Num`

### Roadmap
- Finish a parser
- Conditional logic
- Expression evaluation
- Operations
- Switch statements
- While and for loops
- Returning multiple values
- Custom types (and possibly structs)
- Write an interpreter
- Pointers (asterik and ampersand)
- Module/import system
- Standard library
- System-wide package manager
- Detailed error and debugging messages
- Allow for interop with other languages (C, C++, Java, V, and JS to start)
- Just-in-time compilation for interpreted code
- Write a compiler
- Write an optimizing compiler

### Technologies used

#### Lexing
This project uses Fast Lexical Analyzer Generator (FLEX) to lex source files.

#### Interpreting
This project's primary runtime is written in the V language.
