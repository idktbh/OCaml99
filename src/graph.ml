type 'a t

(* Path from one node to another one. Write a function paths g a b that returns
 * all acyclic path p from node a to node b ≠ a in the graph g.
 *)
let path =


(* Cycle from a given node.
 * Write a functions cycle g a that returns a closed path (cycle) p starting at a
 * given node a in the graph g.
 *)

(* Construct all spanning trees.
 * Write a function s_tree g to construct all spanning trees of a given graph g.
 * With this predicate, find out how many spanning trees there are for the graph
 * depicted to the left.
 *)

(* Construct the minimal spanning tree.  *)

(* Graph isomorphism.
 * Two graphs G1(N1,E1) and G2(N2,E2) are isomorphic if there is a bijection f:
 * N1 → N2 such that for any nodes X,Y of N1, X and Y are adjacent if and only if
 * f(X) and f(Y) are adjacent.
 *)

(* Write a function that determines whether two graphs are isomorphic. *)

(* Node degree and graph coloration.
 * Write a function degree graph node that determines the degree of a given node.
 * Write a function that generates a list of all nodes of a graph sorted according
 * to decreasing degree.
 *)

(* Depth-first order graph traversal.
 * Write a function that generates a depth-first order graph traversal sequence.
 * The starting point should be specified, and the output should be a list of
 * nodes that are reachable from this starting point (in depth-first order).
 *)

(* Write a predicate that splits a graph into its connected components. *)

(* Write a predicate that finds out whether a given graph is bipartite.*)

(* Generate K-regular simple graphs with N nodes.
 * In a K-regular graph all nodes have a degree of K; i.e. the number of edges
 * incident in each node is K. How many (non-isomorphic!) 3-regular graphs with 6
 * nodes are there?
 *)
