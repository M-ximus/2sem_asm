//
// Created by max on 19.05.19.
//

#ifndef BACKEND_COMPILATION_H
#define BACKEND_COMPILATION_H

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/io.h>
#include <fcntl.h>
#include <assert.h>
#include <cctype>
//#include "C:\Program Files (x86)\TX\TXLib.h"

#ifdef _DEBUG
#define ASSERT( x ) assert((x))
#else
#ifdef FASTEST_PROGA
#define ASSERT( x )
#else
#define ASSERT( x ) x
#endif
#endif

enum type_of_data
{
    Operator = 0x73,
    Variable = 0x56,
    Number = 0x4e,
    Function = 0x43,
    Standart_func = 0x53,
    Branching = 0x49,
    Inicialise = 0x69,
    Equality = 0x45,
    Body = 0x42,
    Condition = 0x4f,
    Return = 0x52,
    Parameter = 0x50,
    LOOP = 0x4c
};

enum{
    Memory_error  = -1,
    Link_error    = 24,
    Root_error    = 42,
    Counter_error = 256,
    Delete_error  = -5,
    Syntax_error  = 34
};

const int Max_num_var = 16;
const size_t  Max_size_of_code = 6400;
const char way_to_in[] = "Obj.txt";
const char way_to_out[] = "runfile.out";


typedef char data_t;

struct data_for_tree
{
    int type;
    char* info;
    int num;
};

struct vertex
{
    data_for_tree* data;
    vertex* parent;
    vertex* left_son;
    vertex* right_daughter;
};

struct Tree
{
    vertex* root;
    size_t  counter;
    int     error;
};

struct var
{
    char* name;
    int address;
};

struct func
{
    int   num_params;
    char* name;
    Tree* code;
    var arr_of_vars[Max_num_var] = {};
};

struct func_info
{
    char* name;
    int num_args;
    char* address;
};


char* fillBuff(int inFile);

long int calcSize(const char* inFile);

size_t calc_number_of_special_symbol(char* buff, char symbol);

void print_mode(vertex* pos, FILE* dot_out);

void create_tree(vertex* pos, FILE* dot_out);

void tree_dot(Tree* nameTree, char* dot_out);

//! This function create tree and diploma of the Timiryazev Academy
//!
//! \return pointer of your new brilliant tree
//! \Note can't create Groot
Tree* Tree_construct();

//! This function delete your tree
//!
//! \return 1 if it's Ok and 0 if something has broken
bool Tree_distruct(Tree** myTree);

//! This function delete all branch that started from this vertex
//!
//! \param myTree your tree
//! \param Judah branch that you want to kill
//! \return true if it's Ok and false if something has broken
//! \Note you can use it to clear all tree
bool delete_branch(Tree* myTree, vertex* Judah);

//! This function check your tree
//!
//! \param myTree pointer of your tree
//! \return true if it's ok and false if something has broken
bool Tree_ok(Tree* myTree);

//! This function create empty element of tree
//!
//! \param myTree pointer of your tree
//! \return pointer of the new element or nullptr if calloc can't working
vertex* create_empty_elem(Tree* myTree);

//! This function create new vertex if we want to control all things in tree
//!
//! \param myTree pointer of your tree
//! \param left_vertex pointer to the left son
//! \param right_vertex pointer to the right daughter
//! \param info information that you put into vertex
//! \return pointer of new vertex
//! \Note this vertex don't have parent!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
vertex* create_vertex(Tree* myTree, vertex* left_vertex, vertex* right_vertex);

//! This function return pointer of copy of your data from dinamic memory
//!
//! \param info data that you need to copy
//! \return pointer of copy
data_t* put_info(char* info);

//! This function check all branches of this vertex
//!
//! \param node pointer of your vertex
//! \return true if all branches ok and false if it have some problems
bool Linkers_ok(vertex* node);

//! This function check only one vertex for linking with parents
//!
//! \param node pointer of your vertex
//! \return true if all was ok and false if something has broken
bool check_links(vertex* node);

Tree* Make_tree_from_standart(char** code, func* curr_func);

char* GetName(char** code);

int fillArgs(char** code, var* arr_of_args);

vertex* Make_node(Tree* mytree, char** code, var* arr_of_args);

char* GetVarName(char** code);

int Push_arg(var* arr_of_args, char* new_var);

char* GetInf(char** code);

size_t Compile_tree(func* curr_func, func_info* func_table, char** start_pos);

void compile_node(vertex* curr_node, var* arr_of_vars, func_info* arr_of_func);

void add();

void div();

void cmp();

void mul();

void sub();

void transform_var_table(func* curr_func);

void push_func_addr(char* name, func_info* func_table, char* start_pos);

int find_var(char* name, var* arr_of_var);

void cut_stack(var* arr_of_vars);

void aligh_stack(var* arr_of_vars);

void take_from_memory(int offset);

void push_to_memory(char* name, var* arr_of_vars);

void push_param(int counter);

char* find_add_func(char* name_func, func_info* arr_of_func);

int num_local(var* arr_of_vars);

void start_opcodes(func* curr_func);

void end_opcodes(func* curr_func);

void print_bin_file(char* buff, size_t num_symbols, const char* path);

void read_bin(char** buff, size_t num_symbols ,const char* path);

void num(int number);

void scan();

void print();

void Compile_all_file(func** arr_of_func, func_info* information, char** code);
#endif //BACKEND_COMPILATION_H
