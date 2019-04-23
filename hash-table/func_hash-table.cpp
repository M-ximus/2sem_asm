//
// Created by max on 21.04.19.
//

#include "func_hash-table.h"

int laba(const char* way_to_dictionary, const char* exel)
{
    assert(way_to_dictionary != nullptr);
    assert(exel != nullptr);

    str*  strings_table = Fill_the_Addresses(way_to_dictionary);
    if (strings_table == nullptr)
    {
        Printf("Bad file with dictionary - %s", way_to_dictionary);
        return 7;
    }
    char* clean_address = strings_table[0].String;

    FILE* output = fopen(exel, "wb");
    if (output == nullptr)
    {
        Printf("Bad path %s", exel);
        return 7;
    }

    my_pointer_List** hash_table = nullptr;
    try
    {
        hash_table = new my_pointer_List* [Size_hash_table];
    }
    catch(const std::bad_alloc& elem)
    {
        Printf("%s in laba\n", elem.what());
        return 42;
    }
    make_lab(strings_table, hash_table, output);

    fclose(output);
    cleanMemory(strings_table, &clean_address);

    return 0;
}

size_t nanoogle(const char* way_to_dictionary, const char* way_to_requests, unsigned int (*func_for_calc_hash)(const char*))
{
    assert(way_to_dictionary != nullptr);
    assert(way_to_requests != nullptr);
    assert(func_for_calc_hash != nullptr);

    str* array_of_expressions = Fill_the_Addresses(way_to_dictionary);
    if (array_of_expressions == nullptr)
    {
        Printf("Bad file with dictionary - %s", way_to_dictionary);
        return 0xffffffffffffffff;
    }
    char* dict_buff = array_of_expressions[0].String;

    str* requests = Fill_the_Addresses(way_to_requests);
    if (requests == nullptr)
    {
        Printf("Bad file with dictionary - %s", way_to_dictionary);
        return 0xffffffffffffffff;
    }
    char* req_buff = requests[0].String;

    my_pointer_List** hash_table = nullptr;
    try
    {
        hash_table = new my_pointer_List* [Size_hash_table];
    }
    catch(const std::bad_alloc& elem)
    {
        Printf("In nanoogle %s", elem.what());
        return 0xfeeeeeeeeeeeeeee;
    }
    fill_hash_table(array_of_expressions, hash_table, func_for_calc_hash);

    size_t num_requests = 0;
    for(size_t i = 0; i < Search_cicle; i++)
        num_requests += searching_machine(hash_table, requests, func_for_calc_hash);

    delete_hash_info(hash_table);
    cleanMemory(array_of_expressions, &dict_buff);
    cleanMemory(requests, &req_buff);

    delete[] hash_table;

    return num_requests;
}

int fill_hash_table(str* arr, my_pointer_List** hash_table, unsigned int (*hash_func)(const char*))
{
    ASSERT(arr != nullptr);
    ASSERT(hash_table != nullptr);

    try
    {
        for (int i = 0; i < Size_hash_table; i++)
            hash_table[i] = List_create();
    }
    catch(const std::exception& elem)
    {
        PRINTF("%s in %s->", elem.what(), __PRETTY_FUNCTION__);
        throw;
    }

    size_t i = 0;
    while(arr[i].String != nullptr)
    {
        int index = (*hash_func)(arr[i].String) % Size_hash_table;
        new_head_of_List(hash_table[index], arr[i].String);
        i++;
    }

    return 0;
}

void print_hash_table_stat(my_pointer_List** hash_table, FILE* out)
{
    if (out == nullptr)
    {
        PRINTF("FILE* out file = nullptr in print_hash_table");//TODO exception?
        return;
    }

    for(int i = 0; i < Size_hash_table; i++)
        fprintf(out, "%lu,\n", hash_table[i]->counter);
}


void make_lab(str* strings_arr, my_pointer_List** hash_table, FILE* out)
{
    if (strings_arr == nullptr || hash_table == nullptr)
    {
        PRINTF("Bad args");
        return;
    }

    typedef unsigned int (*hash_function) (const char*);
    hash_function arr_hash[Num_hash_func] ={Hash_const, Hash_first_ASCII, Hash_sum_ASCII, Hash_length, Hash_average_ASCII, Hash_GNU};

    for(int i = 0; i < Num_hash_func; i++)
    {
        fill_hash_table(strings_arr, hash_table, arr_hash[i]);
        print_hash_table_stat(hash_table, out);
        delete_hash_info(hash_table);
    }
}

void delete_hash_info(my_pointer_List** hash_table)
{
    if (hash_table == nullptr)
    {
        PRINTF("Died hash-table\n");
        return;
    }

    for(int i = 0; i < Size_hash_table; i++)
        List_destruct(hash_table + i);
}

unsigned int Hash_const(const char* word)
{
    return 42;
}

unsigned int Hash_first_ASCII(const char* word)
{
    if (word != nullptr)
        return (unsigned int) word[0];
    else
    {
        PRINTF("zero word\n");
        return 0;
    }
}

unsigned int Hash_sum_ASCII(const char* word)
{
    if (word != nullptr)
    {
        int i = 0;
        unsigned int sum = 0;
        while(word[i] != '\0' && word[i] != ':')
        {
            sum += word[i];
            i++;
        }

        return sum;
    }
    else
    {
        PRINTF("zero word\n");
        return 0;
    }
}

unsigned int Hash_length(const char* word)
{
    if (word != nullptr)
    {
        unsigned int counter = 0;
        while(word[counter] != '\0' && word[counter] != ':')
            counter++;
        return counter;
    }
    else
    {
        PRINTF("zero word\n");
        return 0;
    }
}

unsigned int Hash_average_ASCII(const char* word)
{
    if (word != nullptr)
    {
        unsigned int i = 0;
        unsigned int sum = 0;
        while(word[i] != '\0' && word[i] != ':')
        {
            sum += word[i];
            i++;
        }
        if (i == 0)
            return 0;
        else
            return sum / i;
    }
    else
    {
        PRINTF("zero word\n");
        return 0;
    }
}

unsigned int Hash_GNU(const char* word)
{
    if (word != nullptr)
    {
        unsigned int hash = 0;
        unsigned int i = 0;
        while(word[i] != '\0' && word[i] != ':')
        {
            hash = hash * 33 + word[i];
            i++;
        }
        return hash;
    }
    else
    {
        PRINTF("zero word\n");
        return 0;
    }
}

List_pointer_Elem* Find_elem(my_pointer_List* List, const char* request)
{
    if (List == nullptr || request == nullptr)
    {
        Printf("Bad arguments in request\n");
        return nullptr;
    }

    List_pointer_Elem* current = nullptr;
    if (List->head != nullptr)
        current = List->head;
    else
    {
        Printf("Empty list\n");
        return nullptr;
    }

    for(int i = 0; i < List->counter; i++)
    {
        if (compare_req(current->data, request))
            break;

        if (current->next == nullptr)
            return nullptr;

        current = current->next;
    }

    return current;
}

bool compare_req(const char* str_for_comp, const char* request)
{
    if (str_for_comp == nullptr || request == nullptr)
    {
        Printf("Bad arg for comparator\n");
        return false;
    }

    int i = 0;
    while(str_for_comp[i] != '\0' && str_for_comp[i] != ':' && request[i] != '\0')
    {
        if (str_for_comp[i] == request[i])
            i++;
        else
            return false;
    }

    if (request[i] == '\0' && (str_for_comp[i] == ':' || str_for_comp[i] == '\0'))//TODO check listing
        return true;
    else
        return false;
}

int searching_machine(my_pointer_List** hash_table, str* requests, unsigned int (*func_for_calc_hash)(const char*))
{
    assert(hash_table != nullptr);
    assert(requests != nullptr);
    assert(func_for_calc_hash != nullptr);


    int i = 0;
    while(requests[i].String != nullptr)
    {
        //printf("%p %d %s\n", requests[i].String, requests[i].Length,requests[i].String);
        unsigned int hash = (*func_for_calc_hash)(requests[i].String) % Size_hash_table;
        if(!Find_elem(hash_table[hash], requests[i].String))
            printf("Bad research\n");
        i++;
    }

    return i;
}