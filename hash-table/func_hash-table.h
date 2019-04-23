//
// Created by max on 21.04.19.
//

#ifndef HASH_TABLE_FUNC_HASH_TABLE_H
#define HASH_TABLE_FUNC_HASH_TABLE_H

#include <iostream>
#include "List.h"
#include "lib_for_hack.h"

const int Size_hash_table = 1000;
const size_t Num_hash_func = 6;
const char path_to_exel[] = "/home/max/CLionProjects/hash-table/data1.csv";
const char path_to_req[] = "requests.txt";
const size_t Search_cicle = 1000000;

int fill_hash_table(str* arr, my_pointer_List** hash_table, unsigned int (*hash_func)(const char*));
void print_hash_table_stat(my_pointer_List** hash_table, FILE* out);
void make_lab(str* strings_arr, my_pointer_List** hash_table, FILE* out);
void delete_hash_info(my_pointer_List** hash_table);
bool compare_req(const char* str_for_comp, const char* request);
List_pointer_Elem* Find_elem(my_pointer_List* List, const char* request);
int searching_machine(my_pointer_List** hash_table, str* requests, unsigned int (*func_for_calc_hash)(const char*));
int laba(const char* way_to_dictionary, const char* exel);
size_t nanoogle(const char* dictionary, const char* requests, unsigned int (*func_for_calc_hash)(const char*));

//!---------------------------------------------------------------------------------------------------------------------
unsigned int Hash_const(const char* word);
unsigned int Hash_first_ASCII(const char* word);
unsigned int Hash_sum_ASCII(const char* word);
unsigned int Hash_length(const char* word);
unsigned int Hash_average_ASCII(const char* word);
unsigned int Hash_GNU(const char* word);


#endif //HASH_TABLE_FUNC_HASH_TABLE_H
