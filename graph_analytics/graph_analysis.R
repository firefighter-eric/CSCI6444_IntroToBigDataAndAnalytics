library(igraph)

CA.GrQc <- read.delim("CA-GrQc.txt", header=FALSE, comment.char="#")
G = graph_from_data_frame(CA.GrQc, directed = FALSE)
G = simplify(G)
v = V(G)
e = E(G)

# 4
my_is_simple = is_simple(G)
my_edge_list = as_edgelist(G)
my_directed_graph = as.directed(G)
my_undirected_graph = as.undirected(G)
my_all_shortest_paths = all_shortest_paths(G, 1000, 2000)


# 5
# 5.1
cd = centr_degree(G)
max_index = which.max(cd[["res"]])
c = v[max_index]
print("center:")
print(c)
#5.2
sp = shortest.paths(G, v, v)
sp[is.infinite(sp)] = -1
longest_path = max(sp)
print("longest path:")
print(longest_path)
#5.3
lcq = largest_cliques(G)
print("largest clique:")
print(lcq)
