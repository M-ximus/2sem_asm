//
// Created by max on 08.04.19.
//

#ifndef HACK_TEMA_LIB_FOR_HACK_H
#define HACK_TEMA_LIB_FOR_HACK_H

#include <cstdio>
#include <cstring>
#include <cassert>
#include <cmath>
#include <cstdlib>

#ifdef Meow
#define PRINTF printf
#else
#define PRINTF
#endif



const char way_to_in[] = {"/home/max/CLionProjects/hash-table/dictUTF.txt"};
const char way_to_out[] = {"/home/max/CLionProjects/hash-table/new_text.txt"};

struct str {
    char*         String;
    unsigned long Length;
};



//----------------------------------------------------------------------------------------------------------------------
//! Buffer\n\n
//! Here we just fill the Buffer.
//! Very imortant to put '\0' in the end of Buffer for working with it.
//----------------------------------------------------------------------------------------------------------------------

char* Fill_the_Buffer(const char* nameInput, unsigned int* NumStrings = nullptr);

//----------------------------------------------------------------------------------------------------------------------
//! Size\n\n
//! Before we will create the Buffer, we need to know his size.
//! Buffer size - file size.
//----------------------------------------------------------------------------------------------------------------------

long int Size(FILE* InputFile);

//----------------------------------------------------------------------------------------------------------------------
//! numberSymbol\n\n
//! Mini-function for counting any symbol in the text.
//----------------------------------------------------------------------------------------------------------------------

unsigned int numberSymbol(const char* Buffer, char Symbol);

str* Fill_the_Addresses(const char* nameInput);

//----------------------------------------------------------------------------------------------------------------------
//! cleanMemory\n\n
//! Mini-function to clear memory.
//----------------------------------------------------------------------------------------------------------------------

void cleanMemory(str* Addresses, char** CP_Addresses_of_Strings);

void Fill_the_OutputFile(str* Addresses, const char* nameOutput);


#endif //HACK_TEMA_LIB_FOR_HACK_H
