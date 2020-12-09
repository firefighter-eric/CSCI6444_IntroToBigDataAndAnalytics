# 4
library(igraph)

CA.GrQc <- read.delim("CA-GrQc.txt", header=FALSE, comment.char="#")
G = graph_from_data_frame(CA.GrQc, directed = FALSE)
G = simplify(G)
v = V(G)
e = E(G)


my_is_simple = is_simple(G)
my_edge_list = as_edgelist(G)
my_directed_graph = as.directed(G)
my_undirected_graph = as.undirected(G)
my_all_shortest_paths = all_shortest_paths(G, 1000, 2000)


#cluster_label_prop
g <- sample_gnp(10, 5/10) %du% sample_gnp(9, 5/9)
g <- add_edges(g, c(1, 12))
cluster_label_prop(g)

#cluster_fast_greedy
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
fc <- cluster_fast_greedy(g)
membership(fc)
sizes(fc)


#min_st_separators
ring <- make_ring(4)
min_st_separators(ring)
chvatal <- make_graph("chvatal")
min_st_separators(chvatal)



#modularity.igraph Modul
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
wtc <- cluster_walktrap(g)
modularity(wtc)
modularity(g, membership(wtc))


#neighbors
g <- make_graph("Zachary")
n1 <- neighbors(g, 1)
n34 <- neighbors(g, 34)
intersection(n1, n34)


#path
# Create a (directed) wheel
g <- make_star(11, center = 1) + path(2:11, 2)
plot(g)
g <- make_empty_graph(directed = FALSE, n = 10) %>%
  set_vertex_attr("name", value = letters[1:10])
g2 <- g + path("a", "b", "c", "d")
plot(g2)
g3 <- g2 + path("e", "f", "g", weight=1:2, color="red")
E(g3)[[]]
g4 <- g3 + path(c("f", "c", "j", "d"), width=1:3, color="green")
E(g4)[[]]


#similarity
g <- make_ring(5)
similarity(g, method = "dice")
similarity(g, method = "jaccard")
