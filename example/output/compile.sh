inputfile=$1
nasm -f elf64 ${inputfile}.asm
ld -o ${inputfile}A ${inputfile}.o
gcc ${inputfile}.c -o ${inputfile}C
