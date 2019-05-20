//
// Created by max on 19.05.19.
//

#include "Compilation.h"

Tree* Make_tree_from_standart(char** code, func* curr_func)
{
    assert(code      != nullptr);
    assert(curr_func != nullptr);

    curr_func->name = GetName(code);
    curr_func->num_params = fillArgs(code, curr_func->arr_of_vars);

    /*printf("%s\n", curr_func->name);
    printf("%d\n", curr_func->num_params);
    printf("%s\n", curr_func->arr_of_vars[0].name);*/

    curr_func->code = Tree_construct();
    *code = strchr(*code, '{');
    curr_func->code->root = Make_node(curr_func->code, code, curr_func->arr_of_vars);
    tree_dot(curr_func->code, "Dot.dot");
}

char* GetName(char** code)
{
    assert(code  != nullptr);
    assert(*code != nullptr);

    char* old_pos = *code;
    *code = strchr(*code, ' ');
    if (*code == nullptr)
    {
        *code = old_pos;
        return nullptr;
    }

    char* name = (char*) calloc(*code - old_pos + 1, sizeof(*name));

    int i = 0;
    while(old_pos != *code)
    {
        name[i] = *old_pos;
        old_pos++;
        i++;
    }
    name[i] = '\0';
    return name;
}

int fillArgs(char** code, var* arr_of_args)
{
    assert(code != nullptr);
    assert(*code != nullptr);
    assert(arr_of_args != nullptr);

    char* old_code = *code;
    *code = strchr(*code, '(');
    if (*code == nullptr)
    {
        *code = old_code;
        return -1;
    }

    (*code)++;
    int num_params = 0;
    while (**code != ')')
    {
        while (**code == ' ')
            (*code)++;

        if (**code == ')')
            break;

        if (isalpha(**code))
        {
            arr_of_args[num_params].name = GetName(code);
            assert(arr_of_args[num_params].name != nullptr);
            num_params++;
        }

        if (**code == ',')
            (*code)++;
    }
    (*code)++;

    return num_params;
}

vertex* Make_node(Tree* mytree, char** code, var* arr_of_args)
{
    (*code)++;
    if (**code == ' ' || **code == '\0' || **code == '}')
    {
        (*code)++;
        return nullptr;
    }

    vertex* new_node = create_empty_elem(mytree);
    new_node->data->type = **code;

    if (**code == Number)
    {
        (*code)++;
        new_node->data->num = *((int*) (*code));
        *code += 5;
        return new_node;
    }
    if (**code == Body || **code == Parameter || **code == Equality)
    {
        (*code)++;
        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        new_node->right_daughter = Make_node(mytree, code, arr_of_args);
        if (new_node->right_daughter != nullptr)
            new_node->right_daughter->parent = new_node;

        (*code)++;
        return new_node;
    }
    if (**code == Operator)
    {
        (*code)++;
        new_node->data->info = (char*) calloc (1, sizeof(*(new_node->data->info)));
        *(new_node->data->info) = **code;

        (*code)++;
        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        new_node->right_daughter = Make_node(mytree, code, arr_of_args);
        if (new_node->right_daughter != nullptr)
            new_node->right_daughter->parent = new_node;

        (*code)++;
        return new_node;
    }
    if (**code == Variable)
    {
        (*code)++;
        new_node->data->info = GetVarName(code);

        (*code)++;
        return new_node;
    }
    if (**code == Inicialise)
    {
        (*code)++;
        new_node->data->info = GetVarName(code);
        Push_arg(arr_of_args, new_node->data->info);

        (*code)++;
        return new_node;
    }
    if (**code == Branching || **code == LOOP)
    {
        if (**code == Branching)
            new_node->data->info = "If";
        else
            new_node->data->info = "While";
        (*code)++;

        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        new_node->right_daughter = Make_node(mytree, code, arr_of_args);
        if (new_node->right_daughter != nullptr)
            new_node->right_daughter->parent = new_node;

        (*code)++;
        return new_node;
    }
    if (**code == Condition)
    {
        (*code)++;
        new_node->data->info = GetInf(code);

        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        new_node->right_daughter = Make_node(mytree, code, arr_of_args);
        if (new_node->right_daughter != nullptr)
            new_node->right_daughter->parent = new_node;

        (*code)++;
        return new_node;
    }
    if (**code == Return)
    {
        (*code)++;

        new_node->data->info = "Return";

        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        (*code)++;
        return new_node;
    }
    if (**code == Standart_func)
    {
        (*code)++;
        new_node->data->info = GetInf(code);

        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        (*code)++;
        return new_node;
    }
    if (**code == Function)
    {
        (*code)++;
        new_node->data->info = GetInf(code);

        new_node->left_son = Make_node(mytree, code, arr_of_args);
        if (new_node->left_son != nullptr)
            new_node->left_son->parent = new_node;

        (*code)++;
        return new_node;
    }
}

char* GetInf(char** code)
{
    assert(code != nullptr);
    assert(*code != nullptr);

    char* old_pos = *code;

    *code = strchr(*code, '{');
    assert(*code != nullptr);

    char* var_name = (char*) calloc(*code - old_pos + 1, sizeof(*var_name));

    int i = 0;
    while(old_pos < *code)
    {
        var_name[i] = *old_pos;
        i++;
        old_pos++;
    }
    var_name[i] = '\0';

    return var_name;
}


int Push_arg(var* arr_of_args, char* new_var)
{
    assert(new_var != nullptr);

    int num = 0;
    while(num < Max_num_var)
    {
        if (arr_of_args[num].name != nullptr)
            num++;
        else
        {
            arr_of_args[num].name = strdup(new_var);
            arr_of_args[num].address = num;
        }
    }
    return num;
}

char* GetVarName(char** code)
{
    assert(code != nullptr);
    assert(*code != nullptr);

    char* old_pos = *code;

    *code = strchr(*code, '}');
    assert(*code != nullptr);

    char* var_name = (char*) calloc(*code - old_pos + 1, sizeof(*var_name));

    int i = 0;
    while(old_pos < *code)
    {
        var_name[i] = *old_pos;
        i++;
        old_pos++;
    }
    var_name[i] = '\0';

    return var_name;
}
//----------------------------------------------------------------------------------------------------------------------
//! Function that create buffer and fill them from reading file
//!
//! @param[in] int inFile - address of reading file
//!
//! @return - address of this buffer
//----------------------------------------------------------------------------------------------------------------------

char* fillBuff(int inFile)
{
    assert(inFile > 0);

    long int numSymbols = calcSize(way_to_in);
    assert(numSymbols != 0);

    char* buff = (char*) calloc(numSymbols + 20, sizeof(*buff));
    assert(buff != nullptr);

    long int error = read(inFile, buff, numSymbols);
    assert(error == numSymbols);

    return buff;
}

//----------------------------------------------------------------------------------------------------------------------
//! This function calculate number of symbols in file
//!
//! @param[in] const char* inFile - full name of file
//!
//! @return - number of symbols in reading file
//!
//! @Note - this function return position of reading symbol to start of file
//----------------------------------------------------------------------------------------------------------------------

long int calcSize(const char* inFile)
{
    assert(inFile != nullptr);

    struct stat fileInfo;
    stat(inFile, &fileInfo);

    return fileInfo.st_size;
}

//----------------------------------------------------------------------------------------------------------------------
//! This function calculate number of special symbols in array
//!
//! @param[in] char* buff- address of array
//! @param[in] char symbol - symbol that we need find
//!
//! @return - number of strings
//!
//! @Note - this function return position of reading symbol to start of file
//----------------------------------------------------------------------------------------------------------------------

size_t calc_number_of_special_symbol(char* buff, char symbol)
{
    assert(buff != nullptr);

    size_t numSymbols = 1;
    for(char* pos = strchr(buff, symbol);pos;pos = strchr(pos + 1, symbol))
        numSymbols++;

    return numSymbols;
}

//----------------------------------------------------------------------------------------------------------------------
//! This function create array of the strings and fill it
//!
//! @param[in] char* buff - buffer with strings that we divide
//! @param[in] size_t numStrings - number of the strings in buffer
//!
//! @return - new struct with addresses of strings and their length
//!
//! @Note this array like matrix
//----------------------------------------------------------------------------------------------------------------------

Tree* Tree_construct()
{
    Tree* myTree = (Tree*) calloc(1, sizeof(*myTree));
    if (myTree == nullptr)
        return nullptr;

    myTree->root    = nullptr;
    myTree->error   = 0;
    myTree->counter = 0;

    return myTree;
}

int delete_data(data_for_tree** old_data)
{
    if (old_data == nullptr)
        return -1;

    if ((*old_data)->type == Number)
        (*old_data)->num = 42;
    else if ((*old_data)->type == Operator || (*old_data)->type == Variable || (*old_data)->type == Function || (*old_data)->type == Standart_func || (*old_data)->type == Inicialise || (*old_data)->type == Condition)
    {
        free((*old_data)->info);
        (*old_data)->info = nullptr;
    }
    *old_data = nullptr;
    return 0;
}

bool delete_branch(Tree* myTree, vertex* Judah)
{
    ASSERT(Tree_ok(myTree));

    if (Judah == nullptr)
        return true;

    if (Judah->left_son != nullptr)
        delete_branch(myTree, Judah->left_son);
    if (Judah->right_daughter != nullptr)
        delete_branch(myTree, Judah->right_daughter);

    if (Judah->data != nullptr)
        delete_data(&(Judah->data));/////////////

    Judah->data = nullptr;//Poison_for_strings;

    if (Judah->parent != nullptr)
    {
        if (Judah->parent->left_son == Judah)
            Judah->parent->left_son = nullptr;
        else
            Judah->parent->right_daughter = nullptr;

        Judah->parent = nullptr;
    }

    free(Judah);
    myTree->counter--;

    return true;
}

bool Tree_ok(Tree* myTree)
{
    if (myTree == nullptr)
        return false;

    if (myTree->counter == 0 && myTree->root != nullptr)
    {
        myTree->error = Root_error;
        return false;
    }

    if (myTree->counter != 0 && myTree->root == nullptr)
    {
        myTree->error = Counter_error;
        return false;
    }

    if (myTree->error != 0)
        return false;

    if (myTree->counter != 0)
    {
        if (!(Linkers_ok(myTree->root)))
            return false;
    }

    return true;
}

vertex* create_vertex(Tree* myTree, vertex* left_vertex, vertex* right_vertex)
{
    //ASSERT(Tree_ok(myTree));

    vertex* new_vertex = create_empty_elem(myTree);
    if (new_vertex == nullptr)
        return nullptr;

    new_vertex->right_daughter = right_vertex;
    new_vertex->left_son       = left_vertex;
    new_vertex->data           = (data_for_tree*) calloc(1, sizeof(*(new_vertex->data)));


    if(left_vertex != nullptr && right_vertex != nullptr)
    {
        left_vertex->parent  = new_vertex;
        right_vertex->parent = new_vertex;
    }

    // ASSERT(Tree_ok(myTree));

    return new_vertex;
}

bool Tree_distruct(Tree** myTree)
{
    ASSERT(Tree_ok(*myTree));
    if (*myTree == nullptr)
        return false;
    if ((*myTree)->error != 0)
        return false;

    if (!delete_branch(*myTree, (*myTree)->root))
        return false;

    (*myTree)->root = nullptr;

    free(*myTree);
    *myTree = nullptr;

    return  true;
}

data_t* put_info(char* info)
{
    assert(info != nullptr);

    size_t size = strlen(info) + 1;

    if (size == 0)
        return nullptr;

    data_t* data = (data_t*) calloc(size, sizeof(*data));

    if (data != nullptr)
        strcpy(data, info);

    return data;
}

vertex* create_empty_elem(Tree* myTree)
{
    //ASSERT(Tree_ok(myTree));

    vertex* new_elem = (vertex*) calloc(1, sizeof(*new_elem));
    if (new_elem == nullptr)
    {
        myTree->error = Memory_error;
        return nullptr;
    }

    new_elem->data           = (data_for_tree*) calloc(1, sizeof(*(new_elem->data)));
    new_elem->parent         = nullptr;
    new_elem->left_son       = nullptr;
    new_elem->right_daughter = nullptr;
    myTree->counter++;

    return new_elem;
}

bool check_links(vertex* node)
{
    if (node == nullptr)
        return false;

    if (node->left_son != nullptr)
    {
        if (node->left_son->parent != node)
            return false;
    }
    if (node->right_daughter != nullptr)
    {
        if (node->right_daughter->parent != node)
            return false;
    }

    return true;
}

bool Linkers_ok(vertex* node)
{
    if (node == nullptr)
        return false;

    if (!(check_links(node)))
        return false;

    if (node->left_son != nullptr)
    {
        if (!(Linkers_ok(node->left_son)))
            return false;
    }

    if (node->right_daughter != nullptr)
    {
        if (!(Linkers_ok(node->right_daughter)))
            return false;
    }

    if (node->right_daughter == nullptr && node->left_son == nullptr)
        return true;

    return true;
}

void tree_dot(Tree* nameTree, char* dot_out) {
    assert(dot_out);
    ASSERT(Tree_ok(nameTree));

    FILE *file_dot = fopen(dot_out, "wb");
    assert(file_dot);

    fprintf(file_dot, "digraph {\r\n");
    fprintf(file_dot, "\tnode[color = \"#000000\", fontsize = 20];\r\n"
                      "\tedge[color = \"#000000\", fontsize = 20];\r\n");

    create_tree(nameTree->root, file_dot);

    fprintf(file_dot, "}");

    assert(file_dot);
    fclose(file_dot);

    system("dot -Tjpg -o tree.jpg Dot.dot");
    system("xviewer tree.jpg");

    ASSERT(Tree_ok(nameTree));
}

int tmp = 0;
void create_tree(vertex* pos, FILE* dot_out) {
    assert(dot_out);
    assert(pos);

    fprintf(dot_out, "\t\they%d", tmp);
    print_mode(pos, dot_out);
    fprintf(dot_out, ";\r\n");

    int iskan = tmp;

    if (pos->left_son != nullptr) {
        fprintf(dot_out, "\t\they%d", iskan);

        fprintf(dot_out, "->");

        fprintf(dot_out, "hey%d;\r\n", ++tmp);

        create_tree(pos->left_son, dot_out);
    }

    if (pos->right_daughter != nullptr) {
        fprintf(dot_out, "\t\they%d", iskan);

        fprintf(dot_out, "->");

        fprintf(dot_out, "hey%d;\r\n", ++tmp);

        create_tree(pos->right_daughter, dot_out);
    }

    assert(pos);
    assert(dot_out);
}

void print_mode(vertex* pos, FILE* dot_out) {
    assert(pos);
    assert(dot_out);

    switch (pos->data->type) {
        case Function:     fprintf(dot_out, "[label = \"%s\", shape = \"Mcircle\", "
                                            "color=\"#006400\", style=\"filled\", "
                                            "fillcolor = \"#32CD32\"]", pos->data->info);
            break;

        case Operator:     fprintf(dot_out, "[label = \"%s\", shape = \"diamond\", "
                                            "color=\"#FFD700\", style=\"filled\", "
                                            "fillcolor = \"#F0E68C\"]", pos->data->info);
            break;

        case Variable:     fprintf(dot_out, "[label = \"%s\", shape = \"component\", "
                                            "color=\"#8B008B\", style=\"filled\", "
                                            "fillcolor = \"#9932CC\"]", pos->data->info);
            break;

        case Number:       fprintf(dot_out, "[label = \"%d\", shape = \"Msquare\", "
                                            "color=\"#8B0000\", style=\"filled\", "
                                            "fillcolor = \"#FFA07A\"]", pos->data->num);
            break;

        case Standart_func: fprintf(dot_out, "[label = \"%s\", shape = \"doubleoctagon\", "
                                             "color=\"#006400\", style=\"filled\", "
                                             "fillcolor = \"#32CD32\"]", pos->data->info);
            break;

        case Branching:     fprintf(dot_out, "[label = \"%s\", shape = \"box\", "
                                             "color=\"#8B0000\", style=\"filled\", "
                                             "fillcolor = \"#FFA07A\"]", pos->data->info);
            break;

        case LOOP:     fprintf(dot_out, "[label = \"%s\", shape = \"box\", "
                                             "color=\"#8B0000\", style=\"filled\", "
                                             "fillcolor = \"#FFA07A\"]", pos->data->info);
            break;

        case Inicialise: fprintf(dot_out, "[label = \"%s\", shape = \"Mdiamond\", "
                                          "color=\"#8B0000\", style=\"filled\", "
                                          "fillcolor = \"#FFA07A\"]", "Inic");
            break;

        case Equality: fprintf(dot_out, "[label = \"%s\", shape = \"invtrapezium\", "
                                        "color=\"#8B0000\", style=\"filled\", "
                                        "fillcolor = \"#FFA07A\"]", "Solo");
            break;

        case Body: fprintf(dot_out, "[label = \"%s\", shape = \"trapezium\", "
                                    "color=\"#8B0000\", style=\"filled\", "
                                    "fillcolor = \"#FFA07A\"]", "Body");
            break;

        case Condition: fprintf(dot_out, "[label = \"%s\", shape = \"septagon\", "
                                         "color=\"#8B0000\", style=\"filled\", "
                                         "fillcolor = \"#FFA07A\"]", pos->data->info);
            break;

        case Return: fprintf(dot_out, "[label = \"%s\", shape = \"diamond\", "
                                      "color=\"#8B0000\", style=\"filled\", "
                                      "fillcolor = \"#FFC0CB\"]", pos->data->info);
            break;

        case Parameter: fprintf(dot_out, "[label = \"%s\", shape = \"invtrapezium\", "
                                         "color=\"#8B0000\", style=\"filled\", "
                                         "fillcolor = \"#000080\"]", pos->data->info);
            break;

        default:          fprintf(dot_out, "\"error\"");
            break;
    }

    assert(pos);
    assert(dot_out);
}

char* pos = nullptr;
size_t Compile_tree(func* curr_func, func_info* func_table, char* start_pos)
{
    assert(curr_func != nullptr);
    assert(func_table != nullptr);

    transform_var_table(curr_func);
    push_func_addr(curr_func->name, func_table, start_pos);
    compile_node(curr_func->code->root, curr_func->arr_of_vars, func_table);

    return pos - start_pos;
}

void push_func_addr(char* name, func_info* func_table, char* start_pos)
{
    int i = 0;
    while(func_table[i].name != nullptr)
    {
        if (!strcmp(name, func_table[i].name))
        {
            func_table[i].address = pos - start_pos;
            break;
        }
        i++;
    }
}

void transform_var_table(func* curr_func)
{
    int i = 0;
    while(curr_func->arr_of_vars[i].name != nullptr)
    {
        if (i < curr_func->num_params)
            curr_func->arr_of_vars[i].address = i + 1;
        else
            curr_func->arr_of_vars[i].address = - ((curr_func->arr_of_vars[i].address - curr_func->num_params) * 8);

        i++;
    }
}

void compile_node(vertex* curr_node, var* arr_of_vars, func_info* arr_of_func)
{
    switch (curr_node->data->type)
    {
        case Branching:
        {
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
            char* jump_pos = pos;
            pos += 4;
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            int offset = pos - jump_pos - 4;
            *((int*) jump_pos) = offset;
            break;
        }
        case Condition:
        {
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
            cmp();
            if (curr_node->data->info[0] == '=')
            {
                (*pos) = 0x0f;
                *(pos++) = 0x85;
            }
            else if (curr_node->data->info[0] == '>')
            {
                (*pos) = 0x0f;
                *(pos++) = 0x86;
            }
            else if (curr_node->data->info[0] == '<')
            {
                (*pos) = 0x0f;
                *(pos++) = 0x83;
            }
            pos++;
            break;
        }
        case Operator:
        {
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);

            if (curr_node->data->info[0] == '+')
                add();
            else if (curr_node->data->info[0] == '-')
                sub();
            else if (curr_node->data->info[0] == '/')
                div();
            else if (curr_node->data->info[0] == '*')
                mul();

            break;
        }
        case Variable:
        {
            int offset = find_var(curr_node->data->info, arr_of_vars);
            if (offset <= 0)
            {
                *(pos) = 0x48;
                *(pos++) = 0x8b;
                *(pos++) = 0x45;
                *(pos++) = 0x00 + (char)offset;
                *(pos++) = 0x50;
                pos++;
            }
            else
            {
                if (offset < 5)
                {
                    *(pos) = 0x48;
                    *(pos++) = 0x89;
                    switch (offset)
                    {
                        case 1:
                            *(pos++) = 0xf8;
                            break;
                        case 2:
                            *(pos++) = 0xf0;
                            break;
                        case 3:
                            *(pos++) = 0xc8;
                            break;
                        case 4:
                            *(pos++) = 0xd0;
                            break;
                    }
                }
                else if (offset == 5)
                {
                    *(pos) = 0x4c;
                    *(pos++) = 0x89;
                    *(pos++) = 0xc0;
                }
                else if (offset == 6)
                {
                    *(pos) = 0x4c;
                    *(pos++) = 0x89;
                    *(pos++) = 0xc8;
                }
                *(pos++) = 0x50;
                pos++;
            }
            break;
        }
        case Body:
        {
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            break;
        }
        case Return:
        {
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
            *pos = 0x58;
            aligh_stack(arr_of_vars);
            break;
        }


    }
    return;
}

void cut_stack(var* arr_of_vars)
{
    int i = 0;
    int counter = 0;
    while(arr_of_vars[i].name != nullptr)
    {
        if (arr_of_vars[i].address < 0)
            counter++;
        i++;
    }

    *pos = 0x48;
    *(pos++) = 0x83;
    *(pos++) = 0xec;
    *(pos++) = counter * 8;
    pos++;
}

void aligh_stack(var* arr_of_vars)
{
    int i = 0;
    int counter = 0;
    while(arr_of_vars[i].name != nullptr)
    {
        if (arr_of_vars[i].address < 0)
            counter++;
        i++;
    }

    *pos = 0x48;
    *(pos++) = 0x83;
    *(pos++) = 0xc4;
    *(pos++) = counter * 8;
    pos++;
}

int find_var(char* name, var* arr_of_var)
{
    int i = 0;
    while(arr_of_var[i].name != nullptr)
    {
        if (!strcmp(arr_of_var[i].name, name))
            return arr_of_var[i].address;
        i++;
    }
    printf("I can't find this name %s", name);
    abort();
}

void add()
{
    (*pos) = 0x58;// pop rax, pop rbx
    *(pos++) = 0x5b;

    *(pos++) = 0x48;// add rax, rbx
    *(pos++) = 0x01;
    *(pos++) = 0xd8;

    *(pos++) = 0x50;// push rax

    pos++;
}

void div()
{
    *(pos) = 0x58;// pop rax, pop rbx
    *(pos++) = 0x5b;

    *(pos++) = 0x52;// push rdx

    *(pos++) = 0x48;// xor rdx, rdx
    *(pos++) = 0x31;
    *(pos++) = 0xd2;

    *(pos++) = 0x48;// div rbx
    *(pos++) = 0xf7;
    *(pos++) = 0xf3;

    *(pos++) = 0x5a;// pop rdx
    *(pos++) = 0x50;// push rax
}

void cmp()
{
    *pos++ = 0x58; // pop rax
    *pos++ = 0x5b; // pop rbx

    *pos++ = 0x48; // cmp rax, rbx
    *pos++ = 0x39;
    *pos++ = 0xd8;

}

void sub()
{
    *pos++ = 0x58; // pop rax
    *pos++ = 0x5b; // pop rbx

    *pos++ = 0x48; // sub rax, rbx
    *pos++ = 0x29;
    *pos++ = 0xd8;

    *pos++ = 0x50; // push rax
}

void mul()
{
    *pos++ = 0x58; // pop rax
    *pos++ = 0x5b; // pop rbx

    *pos++ = 0x48; // mul rbx
    *pos++ = 0xf7; //
    *pos++ = 0xe3; //

    *pos++ = 0x50; // push rax
}