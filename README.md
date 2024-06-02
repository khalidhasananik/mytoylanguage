# mytoylanguage

A simple compiler for a custom programming language that supports basic arithmetic and variable management, built using Flex, Bison, and LLVM.

## Prerequisites

- LLVM
- FLEX
- BISON
- G++

If you are struggling to install these tools, follow my article
<https://medium.com/@khalid.hasan1/a-beginners-guide-to-installing-compiler-tools-llvm-flex-bison-on-windows-c79374a0c108>
here, I have made a step-by-step guide on how to install these tools.

Here's how to properly format your guide on how to run the code in Markdown:

## How to Run the Code

Follow these steps to get your programming language up and running:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/khalidhasananik/mytoylanguage.git
   ```

2. **Navigate to the Project Directory:**

   ```bash
   cd mytoylanguage
   ```

3. **Compile the Code:**
   Ensure you have Flex, Bison, and LLVM installed before proceeding.

   ```bash
   flex lexer.l
   bison -d parser.y
   g++ -std=c++11 parser.tab.c lex.yy.c -o mylang `llvm-config --cxxflags --ldflags --system-libs --libs core`
   ```

4. **Run the Compiler:**

   ```bash
   ./mylang
   ```

5. **Enter Your Code or Load a File:**
   To run the compiler with a file input:

   ```bash
   ./mylang < test.myl
   ```

Happy coding 🚀

