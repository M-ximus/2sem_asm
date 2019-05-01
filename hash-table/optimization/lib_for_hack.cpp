//
// Created by max on 08.04.19.
//

#include "lib_for_hack.h"

char* Fill_the_Buffer(const char* nameInput, unsigned int* NumStrings) {

    PRINTF("# Entered in Fill_the_Buffer func\n");

    FILE* InputFile = fopen(nameInput, "rb");
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

str* Fill_the_Addresses(const char* nameInput) {
    PRINTF("# Entered in Fill_the_Addresses func\n");

    unsigned int NumStrings = 0;
    char* Buffer = Fill_the_Buffer(nameInput, &NumStrings);

    str* Addresses = (str*) calloc(NumStrings + 1, sizeof(*Addresses));

    PRINTF("%p second calloc\n", &Addresses[0]);

    int i = 0, j = 0;
    Addresses[j].String = &Buffer[i];

    while (Buffer[i] != '\0') {
        if (Buffer[i] == '\n') {
            Buffer[i] = '\0';
            if (Buffer[i + 1] != '\0')
            {
                Addresses[++j].String = &Buffer[i + 1];
                Addresses[j - 1].Length = Addresses[j].String - Addresses[j - 1].String - 1;
            }
            else
                Addresses[j].Length = (Buffer + i) - Addresses[j].String;
        }
        i++;
    }

    Addresses[NumStrings].String = nullptr;
    Addresses[NumStrings].Length = 0;

    PRINTF("# Exit from Fill_the_Addresses\n");

    return Addresses;
}


void cleanMemory(str* Addresses, char** CP_Addresses_of_Strings) {

    PRINTF("# Entered in cleanMemory function\n");

    //memset(Addresses_of_Strings, 0, func);
    //memset(CP_Addresses_of_Strings, 0, func);

    PRINTF("first calloc %p cleaned\n", CP_Addresses_of_Strings[0]);

    free(CP_Addresses_of_Strings[0]);

    PRINTF("second calloc %p cleaned\n", Addresses);

    free(Addresses);

    PRINTF("# Exit from cleanMemory\n");
}

void Fill_the_OutputFile(str* Addresses, const char* nameOutput) {

    PRINTF("# Entered in Fill_the_OutputFile func\n");

    FILE* OutputFile = fopen(nameOutput, "a+");
    if (OutputFile == nullptr) {
        printf("OutputFile is not declared in this scope!");
        exit(0);
    }

    int i = 0;
    while (Addresses[i].String != nullptr) {
        if (*(Addresses[i].String) != '\0') {
            fputs(Addresses[i].String, OutputFile);
            fputc('\n', OutputFile);
        }
        i++;
    }
    fprintf(OutputFile, "\n\n\n\n");

    PRINTF("# Exit from Fill_the_OutputFile\n");
}

unsigned long curr_tick_num()
{
    unsigned int High, Low;
    asm volatile(   ".intel_syntax noprefix\n\t"
                    "RDTSC\n\t"
                    ".att_syntax prefix\n\t"
                    :"=a"(Low), "=d"(High)
                    :
                    :"cc");
    return ((unsigned long)High << 32 | Low);
}