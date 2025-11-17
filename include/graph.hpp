#ifndef GRAPH_H
#define GRAPH_H

#include <vector>


typedef struct edge {
    int u;
    int v;
} Edge;


typedef struct graph {
    int num_nodes;
    int num_edges;

    std::vector<Edge> edges;

} Graph;


Graph *parse_graph(const char *filepath);

#endif
