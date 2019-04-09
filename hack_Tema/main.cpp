#include <cstdio>
#include "lib_for_hack.h"

int main() {

    unsigned int NumStrings = 0;
    char* Buffer = Fill_the_Buffer(way_to_in, &NumStrings);

    FILE* Outfile = fopen(way_to_out, "wb");
    assert(Outfile != nullptr);

    if (Buffer[0x00000ae0] != 0xe9 ||
        Buffer[0x00000ae1] != 0x4f ||
        Buffer[0x000007d7] != 0xe9 ||
        Buffer[0x000007d8] != 0x16)
    {
        Buffer[0x00000ae0] = 0xe9;
        Buffer[0x00000ae1] = 0x4f;
        Buffer[0x000007d7] = 0xe9;
        Buffer[0x000007d8] = 0x16;
        Buffer[0x000007d9] = 0x00;
        printf("Complete! Now you have access\n");
    }
    else
        printf("You have already had access\n");

    fwrite(Buffer, sizeof(char), NumStrings, Outfile);
    fclose(Outfile);


    return 0;
}