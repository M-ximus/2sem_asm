#include <iostream>
#include "Compilation.h"

int main() {
    int path_code = open(way_to_in, O_RDONLY);
    char* code = fillBuff(path_code);
    char* saved_address = code;

    func in_the_far;
    Tree* Groot = Make_tree_from_standart(&code, &in_the_far);

    free(saved_address);
    return 0;
}