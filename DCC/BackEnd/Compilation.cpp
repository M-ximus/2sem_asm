//
// Created by max on 19.05.19.
//

#include "Compilation.h"

void Compile_all_file(func** arr_of_func, func_info* information, char** code)
{
    assert(code != nullptr);
    assert(*code != nullptr);
    assert(information != nullptr);
    assert(arr_of_func != nullptr);

    char* pointer = strchr(*code, '#');
    int i = 0;
    while (pointer != nullptr)
    {
        arr_of_func[i] = (func*) calloc (1, sizeof(func));
        Make_tree_from_standart(&pointer, arr_of_func[i]);
        information[i].name = strdup(arr_of_func[i]->name);
        printf("%s!\n", information[i].name);
        i++;
        pointer = strchr(pointer, '#');
    }

    size_t size_elf = calcSize("a.out");
    char* buff = (char*) calloc (size_elf, sizeof(*buff));
    char* saved_buff = buff;
    read_bin(&buff, size_elf ,"a.out");

    char* second_copy = buff;
    i = 0;
    while (arr_of_func[i] != nullptr)
    {
        transform_var_table(arr_of_func[i]);
        Compile_tree(arr_of_func[i], information, &buff);
        i++;
    }

    buff = second_copy;
    i = 0;
    while (arr_of_func[i] != nullptr)
    {
        Compile_tree(arr_of_func[i], information, &buff);
        i++;
    }

    print_bin_file(saved_buff, size_elf, "run.out");
    free(saved_buff);
}

Tree* Make_tree_from_standart(char** code, func* curr_func)
{
    assert(code      != nullptr);
    assert(curr_func != nullptr);

    curr_func->name = GetName(code);
    curr_func->num_params = fillArgs(code, curr_func->arr_of_vars);

    curr_func->code = Tree_construct();
    *code = strchr(*code, '{');
    curr_func->code->root = Make_node(curr_func->code, code, curr_func->arr_of_vars);

    tree_dot(curr_func->code, "Dot.dot");
}

void read_bin(char** buff, size_t num_symbols ,const char* path)
{
    assert(buff != nullptr);
    assert(path != nullptr);

    FILE* in_file = fopen(path, "rb");
    assert(in_file != nullptr);

    fread(*buff, sizeof(char), num_symbols, in_file);

    fclose(in_file);

    int i = 0;
    while(i < num_symbols)
    {
        if (*((unsigned char*)(*buff) + i) == 0x90)// find first nope
        {
            *buff += i;
            break;
        }
        i++;
    }
}

void print_bin_file(char* buff, size_t num_symbols, const char* path)
{
    assert(buff != nullptr);
    assert(num_symbols != 0);
    assert(path != nullptr);

    FILE* out_file = fopen(path, "wb");
    assert(out_file != nullptr);

    fwrite(buff, sizeof(char), num_symbols, out_file);

    fclose(out_file);
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

    char* name = (char*) calloc(*code - old_pos, sizeof(*name));

    int i = 0;
    old_pos++;
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
            arr_of_args[num_params].name = GetParam(code);
            assert(arr_of_args[num_params].name != nullptr);
            num_params++;
        }

        if (**code == ',')
            (*code)++;
    }
    (*code)++;

    return num_params;
}

char* GetParam(char** code)
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

    char* name = (char*) calloc(*code - old_pos, sizeof(*name));

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
            break;
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
size_t Compile_tree(func* curr_func, func_info* func_table, char** start_pos)
{
    assert(curr_func != nullptr);
    assert(func_table != nullptr);

    pos = *start_pos;

    push_func_addr(curr_func->name, func_table, *start_pos);
    start_opcodes(curr_func);

    compile_node(curr_func->code->root, curr_func->arr_of_vars, func_table);

    end_opcodes(curr_func);
    *start_pos = pos;

    return pos - *start_pos;
}

void end_opcodes(func* curr_func)
{
    *(pos) = 0x48;// add rsp, offset
    pos++;
    *(pos) = 0x83;
    pos++;
    *(pos) = 0xc4;

    pos++;
    int offset = num_local(curr_func->arr_of_vars);
    *((int*) pos) = offset * 8;

    pos++;
    *(pos) = 0x5d;// pop rbp
    pos++;

    *pos = 0xb8;// mov rax, 0x3c
    pos++;
    *((int*) pos) = 0x3c;
    pos += 4;

    *pos = 0x48;// xor rdi, rdi
    pos++;
    *pos = 0x31;
    pos++;
    *pos = 0xff;
    pos++;

    *pos = 0x0f;// syscall
    pos++;
    *pos = 0x05;
    pos++;
}

void start_opcodes(func* curr_func)
{
    *(pos) = 0x55;// push rbp
    pos++;
    *(pos) = 0x48;// mov rbp, rsp
    pos++;
    *(pos) = 0x89;
    pos++;
    *(pos) = 0xe5;

    pos++;
    *(pos) = 0x48;// sub rsp, offset
    pos++;
    *(pos) = 0x83;
    pos++;
    *(pos) = 0xec;

    int offset = num_local(curr_func->arr_of_vars);

    pos++;
    *((int*) pos) = offset * 8;

    pos++;
}

int num_local(var* arr_of_vars)
{
    int i = 0;
    int counter = 0;
    while(arr_of_vars[i].name != nullptr)
    {
        if (arr_of_vars[i].address <= 0)
            counter++;
        i++;
    }
    return counter;
}

void push_func_addr(char* name, func_info* func_table, char* start_pos)
{
    int i = 0;
    while(func_table[i].name != nullptr)
    {
        if (!strcmp(name, func_table[i].name))
        {
            func_table[i].address = pos;
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
            curr_func->arr_of_vars[i].address = - ((curr_func->arr_of_vars[i].address - curr_func->num_params + 1) * 8);

        printf("%s %d", curr_func->arr_of_vars[i].name, curr_func->arr_of_vars[i].address);
        i++;
    }
}


int num_of_param_dont_touch_it = 0;

void compile_node(vertex* curr_node, var* arr_of_vars, func_info* arr_of_func)
{
    if (curr_node == nullptr)
        return;

    switch (curr_node->data->type)
    {
        case Branching:
        {
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
            char* jump_pos = pos;
            pos += 4;
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            int offset = pos - jump_pos - 4;//offset for jne, jnb, jna
            *((int*) jump_pos) = offset;
            break;
        }
        case Number:
            num(curr_node->data->num);
            break;
        case Condition:
        {
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
            cmp();
            if (curr_node->data->info[0] == '=')
            {
                (*pos) = 0x0f;//jne
                pos++;
                *(pos) = 0x85;
            }
            else if (curr_node->data->info[0] == '>')
            {
                (*pos) = 0x0f;//jna
                pos++;
                *(pos) = 0x86;
            }
            else if (curr_node->data->info[0] == '<')
            {
                (*pos) = 0x0f;//jnb
                pos++;
                *(pos) = 0x83;
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
            take_from_memory(offset);
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
            *(pos) = 0x58;// pop rax
            pos++;

            aligh_stack(arr_of_vars);

            *(pos) = 0x5d;// pop rbp
            pos++;
            *(pos) = 0xc3;// ret
            pos++;
            break;
        }
        case Equality:
        {
            compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);
            *pos = 0x58;// pop rax
            pos++;

            push_to_memory(curr_node->left_son->data->info, arr_of_vars);
            break;
        }
        case Parameter:
        {
            compile_node(curr_node->left_son, arr_of_vars, arr_of_func);

            num_of_param_dont_touch_it++;
            push_param(num_of_param_dont_touch_it);

            if (curr_node->right_daughter != nullptr)
                compile_node(curr_node->right_daughter, arr_of_vars, arr_of_func);

            num_of_param_dont_touch_it--;
            break;
        }
        case Function:
        {
            if (curr_node->left_son != nullptr)
                compile_node(curr_node->left_son, arr_of_vars, arr_of_func);

            save_registers(arr_of_vars);

            *pos = 0xe8;// call offset(32-bit)
            pos++;
            *((int*) pos) = find_add_func(curr_node->data->info, arr_of_func) - (pos + 4);
            pos += 4;

            return_registers(arr_of_vars);

            *pos = 0x50;// push rax
            pos++;
            break;
        }
        case Inicialise:
        {
            break;
        }
        case Standart_func:
        {
            if (curr_node->data->info[0] == '1')
            {
                compile_node(curr_node->left_son, arr_of_vars, arr_of_func);
                print();
            }
            else if (curr_node->data->info[0] == '0')
            {
                scan();
            }
        }

    }
    return;
}

char* find_add_func(char* name_func, func_info* arr_of_func)
{
    int i = 0;
    while (arr_of_func[i].name != nullptr)
    {
        if (!strcmp(name_func, arr_of_func[i].name))
            return arr_of_func[i].address;
        i++;
    }
    printf("I can't find this func - %s!", name_func);
    abort();
}

void push_param(int counter)
{
    if  (counter > 6)
    {
        return;
    }
    else if (counter == 1)
        *(pos) = 0x5f;// push rdi
    else if (counter == 2)
        *(pos) = 0x5e;// push rsi
    else if (counter == 3)
        *(pos) = 0x5a;// push rdx
    else if (counter == 4)
        *(pos) = 0x59;// push rcx
    else if (counter == 5)
    {
        *(pos) = 0x41;// push r8
        pos++;
        *(pos) = 0x58;
    }
    else if (counter == 6)
    {
        *(pos) = 0x41;// push r9
        pos++;
        *(pos) = 0x59;
    }
    pos++;
}

void push_to_memory(char* name, var* arr_of_vars)
{
    int offset = find_var(name, arr_of_vars);

    if (offset <= 0)
    {
        *(pos) = 0x48;// mov [rbp - offset], rax
        pos++;
        *(pos) = 0x89;
        pos++;
        *(pos) = 0x45;

        pos++;
        *(pos) = 0x00 + (char)offset;
        pos++;
    }
    else
    {
        if (offset < 5)
        {
            *(pos) = 0x48;
            pos++;
            *(pos) = 0x89;
            switch (offset)
            {
                case 1:
                    pos++;
                    *(pos) = 0xc7;// mov rdi, rax
                    break;
                case 2:
                    pos++;
                    *(pos) = 0xc6;// mov rsi, rax
                    break;
                case 3:
                    pos++;
                    *(pos) = 0xc2;// mov rdx, rax
                    break;
                case 4:
                    pos++;
                    *(pos) = 0xc1;// mov rcx, rax
                    break;
            }
        }
        else if (offset == 5)
        {
            *(pos) = 0x49;// mov r8, rax
            pos++;
            *(pos) = 0x89;
            pos++;
            *(pos) = 0xc0;
        }
        else if (offset == 6)
        {
            *(pos) = 0x49;// mov r9, rax
            pos++;
            *(pos) = 0x89;
            pos++;
            *(pos) = 0xc1;
        }
        pos++;
    }

}

void take_from_memory(int offset)
{
    if (offset <= 0)
    {
        *(pos) = 0x48;// mov rax, [rbp - offset]
        pos++;
        *(pos) = 0x8b;
        pos++;
        *(pos) = 0x45;
        pos++;
        *(pos) = 0x00 + (char)offset;
        pos++;
        *(pos) = 0x50;// push rax
        pos++;
    }
    else
    {
        if (offset < 5)
        {
            *(pos) = 0x48;
            pos++;
            *(pos) = 0x89;
            switch (offset)
            {
                case 1:
                    pos++;
                    *(pos) = 0xf8;// mov rax, rdi
                    break;
                case 2:
                    pos++;
                    *(pos) = 0xf0;// mov rax, rsi
                    break;
                case 3:
                    pos++;
                    *(pos) = 0xc8;// mov rax, rdx
                    break;
                case 4:
                    pos++;
                    *(pos) = 0xd0;// mov rax, rcx
                    break;
            }
        }
        else if (offset == 5)
        {
            *(pos) = 0x4c;// mov rax, r8
            pos++;
            *(pos) = 0x89;
            pos++;
            *(pos) = 0xc0;
        }
        else if (offset == 6)
        {
            *(pos) = 0x4c;// mov rax, r9
            pos++;
            *(pos) = 0x89;
            pos++;
            *(pos) = 0xc8;
        }
        pos++;
        *(pos) = 0x50;// push rax
        pos++;
    }
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

    *pos = 0x48;// sub rsp, counter * 8
    pos++;
    *(pos) = 0x83;
    pos++;
    *(pos) = 0xec;
    pos++;
    *(pos) = counter * 8;
    pos++;
}

void aligh_stack(var* arr_of_vars)
{
    int i = 0;
    int counter = 0;
    while(arr_of_vars[i].name != nullptr)
    {
        if (arr_of_vars[i].address <= 0)
            counter++;
        i++;
    }

    *pos = 0x48;// add rsp, counter * 8
    pos++;
    *(pos) = 0x83;
    pos++;
    *(pos) = 0xc4;
    pos++;
    *(pos) = counter * 8;
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
    pos++;
    *(pos) = 0x5b;

    pos++;
    *(pos) = 0x48;// add rax, rbx

    pos++;
    *(pos) = 0x01;
    pos++;
    *(pos) = 0xd8;

    pos++;
    *(pos) = 0x50;// push rax

    pos++;
}

void div()
{
    *(pos) = 0x58;// pop rax, pop rbx
    pos++;
    *(pos) = 0x5b;

    pos++;
    *(pos) = 0x52;// push rdx

    pos++;
    *(pos) = 0x48;// xor rdx, rdx
    pos++;
    *(pos) = 0x31;
    pos++;
    *(pos) = 0xd2;

    pos++;
    *(pos) = 0x48;// div rbx
    pos++;
    *(pos) = 0xf7;
    pos++;
    *(pos) = 0xf3;

    pos++;
    *(pos) = 0x5a;// pop rdx
    pos++;
    *(pos) = 0x50;// push rax

    pos++;
}

void cmp()
{
    *pos = 0x58; // pop rax
    pos++;
    *pos = 0x5b; // pop rbx

    pos++;
    *pos = 0x48; // cmp rax, rbx
    pos++;
    *pos = 0x39;
    pos++;
    *pos = 0xd8;

    pos++;

}

void sub()
{
    *pos = 0x58; // pop rax
    pos++;
    *pos = 0x5b; // pop rbx

    pos++;
    *pos = 0x48; // sub rax, rbx
    pos++;
    *pos = 0x29;
    pos++;
    *pos = 0xd8;

    pos++;
    *pos = 0x50; // push rax

    pos++;
}

void mul()
{
    *pos = 0x58; // pop rax
    pos++;
    *pos = 0x5b; // pop rbx

    pos++;
    *pos = 0x48; // mul rbx
    pos++;
    *pos = 0xf7; //
    pos++;
    *pos = 0xe3; //

    pos++;
    *pos = 0x50; // push rax

    pos++;
}

void num(int number)
{
    *pos = 0xb8;// mov rax, number

    pos++;
    *((int*) pos) = number;
    pos += 4;

    *pos = 0x50; // push rax
    pos++;
}

void scan() {
    *pos++ = 0x41;
    *pos++ = 0x53;
    *pos++ = 0x56;
    *pos++ = 0x57;
    *pos++ = 0x52;
    *pos++ = 0x51;
    *pos++ = 0x48;
    *pos++ = 0x83;
    *pos++ = 0xec;
    *pos++ = 0x10;
    *pos++ = 0xb8;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x48;
    *pos++ = 0x89;
    *pos++ = 0xe6;
    *pos++ = 0xba;
    *pos++ = 0x0a;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0xbf;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x0f;
    *pos++ = 0x05;
    *pos++ = 0x48;
    *pos++ = 0x89;
    *pos++ = 0xc1;
    *pos++ = 0x48;
    *pos++ = 0xff;
    *pos++ = 0xc9;
    *pos++ = 0x48;
    *pos++ = 0x31;
    *pos++ = 0xc0;
    *pos++ = 0x41;
    *pos++ = 0xbb;
    *pos++ = 0x0a;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x00;
    *pos++ = 0x48;
    *pos++ = 0x31;
    *pos++ = 0xf6;
    *pos++ = 0x8a;
    *pos++ = 0x1c;
    *pos++ = 0x34;
    *pos++ = 0x80;
    *pos++ = 0xeb;
    *pos++ = 0x30;
    *pos++ = 0x49;
    *pos++ = 0xf7;
    *pos++ = 0xe3;
    *pos++ = 0x48;
    *pos++ = 0x01;
    *pos++ = 0xd8;
    *pos++ = 0x48;
    *pos++ = 0xff;
    *pos++ = 0xc6;
    *pos++ = 0xe2;
    *pos++ = 0xef;
    *pos++ = 0x48;
    *pos++ = 0x83;
    *pos++ = 0xc4;
    *pos++ = 0x10;
    *pos++ = 0x59;
    *pos++ = 0x5a;
    *pos++ = 0x5f;
    *pos++ = 0x5e;
    *pos++ = 0x41;
    *pos++ = 0x5b;
    *pos++ = 0x50;
}

void print() {
    /* *pos++ = 0xb8;
    *pos++ = 0x34;
    *pos++ = 0xb1;
    *pos++ = 0x01;
    *pos++ = 0x00;
    *pos++ = 0x50;*/

    *pos++ = 0x55; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x89; //ahahahhahahhahahha
    *pos++ = 0xe5; //ahahahhahahhahahha
    *pos++ = 0x57; //ahahahhahahhahahha
    *pos++ = 0x56; //ahahahhahahhahahha
    *pos++ = 0x51; //ahahahhahahhahahha
    *pos++ = 0x52; //ahahahhahahhahahha
    *pos++ = 0x41; //ahahahhahahhahahha
    *pos++ = 0x53; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x83; //ahahahhahahhahahha
    *pos++ = 0xec; //ahahahhahahhahahha
    *pos++ = 0x10; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x8b; //ahahahhahahhahahha
    *pos++ = 0x45; //ahahahhahahhahahha
    *pos++ = 0x08; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x31; //ahahahhahahhahahha
    *pos++ = 0xd2; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x39; //ahahahhahahhahahha
    *pos++ = 0xd0; //ahahahhahahhahahha
    *pos++ = 0x75; //ahahahhahahhahahha
    *pos++ = 0x0c; //ahahahhahahhahahha
    *pos++ = 0xb2; //ahahahhahahhahahha
    *pos++ = 0x30; //ahahahhahahhahahha
    *pos++ = 0x88; //ahahahhahahhahahha
    *pos++ = 0x14; //ahahahhahahhahahha
    *pos++ = 0x24; //ahahahhahahhahahha
    *pos++ = 0xb8; //ahahahhahahhahahha
    *pos++ = 0x01; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0xeb; //ahahahhahahhahahha
    *pos++ = 0x3d; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x31; //ahahahhahahhahahha
    *pos++ = 0xff; //ahahahhahahhahahha
    *pos++ = 0xbb; //ahahahhahahhahahha
    *pos++ = 0x0a; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0xff; //ahahahhahahhahahha
    *pos++ = 0xc7; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x31; //ahahahhahahhahahha
    *pos++ = 0xd2; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0xf7; //ahahahhahahhahahha
    *pos++ = 0xf3; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x83; //ahahahhahahhahahha
    *pos++ = 0xf8; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x75; //ahahahhahahhahahha
    *pos++ = 0xf1; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x89; //ahahahhahahhahahha
    *pos++ = 0xf9; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x8b; //ahahahhahahhahahha
    *pos++ = 0x45; //ahahahhahahhahahha
    *pos++ = 0x08; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0xff; //ahahahhahahhahahha
    *pos++ = 0xcf; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x31; //ahahahhahahhahahha
    *pos++ = 0xd2; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0xf7; //ahahahhahahhahahha
    *pos++ = 0xf3; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x83; //ahahahhahahhahahha
    *pos++ = 0xc2; //ahahahhahahhahahha
    *pos++ = 0x30; //ahahahhahahhahahha
    *pos++ = 0x88; //ahahahhahahhahahha
    *pos++ = 0x14; //ahahahhahahhahahha
    *pos++ = 0x3c; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x83; //ahahahhahahhahahha
    *pos++ = 0xff; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x75; //ahahahhahahhahahha
    *pos++ = 0xea; //ahahahhahahhahahha
    *pos++ = 0xb8; //ahahahhahahhahahha
    *pos++ = 0x0a; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x89; //ahahahhahahhahahha
    *pos++ = 0x04; //ahahahhahahhahahha
    *pos++ = 0x0c; //ahahahhahahhahahha
    *pos++ = 0xb8; //ahahahhahahhahahha
    *pos++ = 0x01; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x48; //ahahahhahahhahahha
    *pos++ = 0x89; //ahahahhahahhahahha
    *pos++ = 0xe6; //ahahahhahahhahahha
    *pos++ = 0xba; //ahahahhahahhahahha
    *pos++ = 0x0a; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0xbf; //ahahahhahahhahahha
    *pos++ = 0x01; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x00; //ahahahhahahhahahha
    *pos++ = 0x0f; //ahahahhahahhahahha
    *pos++ = 0x05; //ahahahhahahhahahha
    *pos++ = 0x41; //ahahahhahahhahahha
    *pos++ = 0x5b; //ahahahhahahhahahha
    *pos++ = 0x5a; //ahahahhahahhahahha
    *pos++ = 0x59; //ahahahhahahhahahha
    *pos++ = 0x5e; //ahahahhahahhahahha
    *pos++ = 0x5f; //ahahahhahahhahahha
}

void save_registers(var* arr_of_func)
{
    int i = 0;
    while (arr_of_func[i].name != nullptr)
    {
        if (arr_of_func[i].address > 0)
        {
            switch (arr_of_func[i].address)
            {
                case 1:
                    *pos = 0x57;// push rdi
                    pos++;
                    break;
                case 2:
                    *pos = 0x56;// push rsi
                    pos++;
                    break;
                case 3:
                    *pos = 0x52;// push rdx
                    pos++;
                    break;
                case 4:
                    *pos = 0x51;// push rcx
                    pos++;
                    break;
                case 5:
                    *pos = 0x41;// push r8
                    pos++;
                    *pos = 0x50;
                    pos++;
                    break;
                case 6:
                    *pos = 0x41;// push r9
                    pos++;
                    *pos = 0x51;
                    pos++;
                    break;
            }
        }
        i++;
    }
}

void return_registers(var* arr_of_func)
{
    int i = 0;
    while (arr_of_func[i].name != nullptr)
    {
        if (arr_of_func[i].address > 0)
        {
            switch (arr_of_func[i].address)
            {
                case 1:
                    *pos = 0x5f;// pop rdi
                    pos++;
                    break;
                case 2:
                    *pos = 0x5e;// pop rsi
                    pos++;
                    break;
                case 3:
                    *pos = 0x5a;// pop rdx
                    pos++;
                    break;
                case 4:
                    *pos = 0x59;// pop rcx
                    pos++;
                    break;
                case 5:
                    *pos = 0x41;// pop r8
                    pos++;
                    *pos = 0x58;
                    pos++;
                    break;
                case 6:
                    *pos = 0x41;// pop r9
                    pos++;
                    *pos = 0x59;
                    pos++;
                    break;
            }
        }
        i++;
    }
}