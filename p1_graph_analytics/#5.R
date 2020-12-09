library(igraph)

CA.GrQc <- read.delim("CA-GrQc.txt", header=FALSE, comment.char="#")
G = graph_from_data_frame(CA.GrQc, directed = FALSE)
G = simplify(G)
v = V(G)
e = E(G)

# 5.1 central nodes
cd = centr_degree(G)
max_index = which.max(cd[["res"]])
c = v[max_index]
print("center:")
print(c)

#5.2 longest path
sp = shortest.paths(G, v, v)
sp[is.infinite(sp)] = -1
longest_path = max(sp)
print("longest path:")
print(longest_path)

#5.3 largest clique
lcq = largest_cliques(G)
print("largest clique:")
print(lcq)

#5.4 ego(s)

ego(
    G, 
    order = 1, 
    nodes = V(G), 
    mode = c("all", "out", "in"),
    mindist = 0
)

#5.5 power_centrality
power_centrality(
  G,
  nodes = V(G),
  loops = FALSE,
  exponent = 0.9,
  rescale = FALSE,
  tol = 1e-07,
  sparse = TRUE
)