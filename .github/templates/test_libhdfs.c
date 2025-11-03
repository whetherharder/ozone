#include "hdfs.h"
#include <stdio.h>

int main() {
    printf("libhdfs smoke test\n");
    printf("libhdfs version compiled successfully\n");

    struct hdfsBuilder *builder = hdfsNewBuilder();
    if (builder) {
        printf("✅ hdfsNewBuilder() works\n");
        hdfsFreeBuilder(builder);
    }

    return 0;
}
