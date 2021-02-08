#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  int* i = (int*)malloc(sizeof(int));
  *i = 10;
  FILE* fp = fopen("test.txt","r");
  return 0;
}
