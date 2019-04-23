#include "UNITTEST.h"
#include "List.h"

bool Unittest()
{
    my_pointer_List* test_list = List_create();
    UNITTEST(test_list->counter, ==, 0)
    UNITTEST(test_list->head, ==, nullptr)
    UNITTEST(test_list->tail, ==, nullptr)

    new_head_of_List(test_list, "Artem_the_best");
    UNITTEST(test_list->head, ==, test_list->tail)
    UNITTEST(test_list->counter, ==, 1)

    List_pointer_Elem* test_elem = List_remoov(test_list, test_list->head, "Arv1k_pidor");
    UNITTEST(test_list->head, !=, test_list->tail)
    UNITTEST(test_list->tail, ==, test_elem)

    UNITTEST(test_list->error, ==, 0)
    List_destruct(&test_list);
    UNITTEST(test_list, ==, nullptr)

    return true;
}

