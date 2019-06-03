#include <stdio.h>
#include "optimized_functions.h"
#include <string.h>

int main()
{
  char test_string[] = "qwertyuioasdfghjkzxcvbnmytrewertyuiuytjgfghjhgygyg";
  unsigned long strlen_time = 0;
  unsigned long strchr_time = 0;
  unsigned long start = curr_tick_num();
  strlen(test_string);
  strlen_time = curr_tick_num() - start;

  start = curr_tick_num();
  strchr(test_string, '\0');
  strchr_time = curr_tick_num() - start;

  start = curr_tick_num();
  strlen(test_string);
  strlen_time = curr_tick_num() - start;

  printf("strlen - %lu\nstrchr - %lu\n", strlen_time, strchr_time);

  return 0;
}
