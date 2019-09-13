#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main() {
    printf("hello world!");

    setbuf(stdout, NULL);   // disable output buffering
}

void str() {
    char *str = malloc(8);
    strcpy(str, "abcdefgh");
    str = realloc(str, strlen(str)+8);
    strcat(str, "ijklmnop");
    char *pos;
    pos = strstr(str, "efgh");	// find the index of substring
}

void time() {
    time_t starttime = time(NULL);
}
