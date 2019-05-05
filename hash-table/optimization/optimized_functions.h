//
// Created by max on 05.05.19.
//

#ifndef HASH_TABLE_OPTIMIZED_FUNCTIONS_H
#define HASH_TABLE_OPTIMIZED_FUNCTIONS_H

#include <stdio.h>

#define CATS

#ifdef CATS
#define PRINTF printf
#else
#define PRINTF
#endif

unsigned long curr_tick_num();
bool compare_req_optimized(const char* str_for_comp, const char* request);
unsigned int Hash_sum_ASCII_optimized(const char* word);

#endif //HASH_TABLE_OPTIMIZED_FUNCTIONS_H
