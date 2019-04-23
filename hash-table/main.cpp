#include "func_hash-table.h"

#

int main() {
    try
    {
        int error = laba(way_to_in, path_to_exel);
        if (error != 0) throw error;

        size_t num_req = nanoogle(way_to_in, path_to_req, Hash_GNU);
        printf("%lu\n", num_req);
    }
    catch(const std::exception& elem)
    {
        PRINTF("%s", elem.what());
        return 1;
    }
    catch(int error)
    {
        PRINTF("Num of error = %d", error);
        return error;
    }
    catch(...)
    {
        PRINTF("Bad problems with exception. And I can't work with it");
    }

    return 0;
}