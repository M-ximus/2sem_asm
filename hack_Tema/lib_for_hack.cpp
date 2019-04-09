//
// Created by max on 08.04.19.
//

#include "lib_for_hack.h"

char* Fill_the_Buffer(const char* nameInput, unsigned int* NumStrings) {

    PRINTF("# Entered in Fill_the_Buffer func\n");

    FILE* InputFile = fopen(nameInput, "r");
    if (InputFile == nullptr) {
        printf("InputFile is not declared in this scope!");
        return nullptr;
    }

    unsigned int NumSymbols = Size(InputFile);

    char* Buffer = (char*) calloc(NumSymbols + 1, sizeof(*Buffer));
    fread(Buffer, sizeof(*Buffer), NumSymbols, InputFile);
    fclose(InputFile);

    PRINTF("%p, first calloc\n", &Buffer[0]);

    Buffer[NumSymbols] = '\0';

    if (NumStrings != nullptr) *NumStrings = NumSymbols;

    PRINTF("# Exit from Fill_the_Buffer\n");

    return Buffer;
}

long int Size(FILE* InputFile) {

    PRINTF("# Entered in Size func\n");

    long Position = ftell(InputFile);

    fseek(InputFile, 0, SEEK_END);
    long int NumSymbols = ftell(InputFile);
    fseek(InputFile, Position, SEEK_SET);

    PRINTF("# Exit from Size\n");

    return NumSymbols;
}

unsigned int numberSymbol(const char* Buffer, char Symbol) {

    PRINTF("# Entered in numberSymbol func\n");

    unsigned int number_of_symbol = 0;

    int i = 0;
    while (Buffer[i] != '\0') {
        if (Buffer[i] == Symbol) {
            number_of_symbol++;
        }
        i++;
    }

    PRINTF("# Exit from numberSymbol\n");

    return number_of_symbol;
}