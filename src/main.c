#include <stdio.h>
#include <stdint.h>

struct Pigeon {
    char value[128];
    char key[32];
    uint32_t hash;
    uint8_t is_active;
};

int main(void) {
    printf("Hello World!");
    return 0;
}

