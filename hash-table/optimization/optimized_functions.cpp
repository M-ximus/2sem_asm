//
// Created by max on 05.05.19.
//

#include "optimized_functions.h"

unsigned int Hash_sum_ASCII_optimized(const char* word)
{
    if (word != nullptr)
    {
        int i = 0;
        unsigned int sum_0 = 0;
        unsigned int sum_1 = 0;
        unsigned int sum_2 = 0;
        unsigned int sum_3 = 0;
        while(word[i] != '\0'  && word[i + 1] != '\0' && word[i + 2] != '\0' && word[i + 3] != '\0')
        {
            sum_0 += (*(int*) word);
            //sum_1 += word[i + 1];
            //sum_2 += word[i + 2];
            //sum_3 += word[i + 3];
            i += 4;
        }

        return sum_0;
    }
    else
    {
        PRINTF("zero word\n");
        return 0;
    }
}

bool compare_req(const char* str_for_comp, const char* request)
{
    if (str_for_comp == nullptr || request == nullptr)//TODO kill first check
    {
        PRINTF("Bad arg for comparator\n");
        return false;
    }

    size_t i;//will equal 1 after asm
    asm volatile(".intel_syntax noprefix\n\t"
        "mov rdx, [rdi]\n\t"
        "mov rax, [rsi]\n\t"
        "cmp al, dl\n\t"
        "je .Maybe_equal\n\t"
        "xor rax, rax\n\t"
        "pop rbp\n\t"
        "ret\n\t"
        ".Maybe_equal:\n\t"
        ".att_syntax prefix\n\t"
        "xorq %[Counter], %[Counter]\n\t"
        "inc %[Counter]\n\t"
        :[Counter]"=r"(i)
        :
        :"cc");

    while(str_for_comp[i] != '\0' && str_for_comp[i] != ':' && request[i] != '\0')
    {
        if (str_for_comp[i] != request[i])
            break;
        i++;
    }

    if (request[i] == '\0' && (str_for_comp[i] == ':' || str_for_comp[i] == '\0'))//TODO check listing
        return true;
    else
        return false;

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