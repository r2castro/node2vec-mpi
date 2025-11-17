#include "graph.hpp"

#include <cstdlib>
#include <cstdio>

using namespace std;

Graph *parse_graph(const char *filepath) {
    Graph *g = new Graph;

    FILE *file = fopen(filepath, "r");
    if (!file) {
        exit(1);
    }

    //int u,v;



    
    fclose(file);

    return g;
}


