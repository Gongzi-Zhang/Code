**Graphviz is designed to generate graphs with pleasing appearance. Trying to force layout defeats much of the value of the tool.**

For a large graph, often one want to draw a smaller graph by extracting 
an interesting pieces of the original graph before running *dot*. 
The tools that can help:
* **sccmap**  decompose the graph into strongly connected components
* **tred**    compute transitive reduction (remove edges implied by transitivity)
* **gvpr**    graph processor to select nodes or edges, and contract or remove the rest of the graph
* **unflatten** improve aspect ratio of trees by staggering the lengths of leaf edges


# PDF
for unknown problem, *dot* can't produce multiple plots in single pdf file. If you really need that,
you can produce it firstly into ps with the option: 
   dot -Tps2 file.dot
and then convert ps file into pdf with *ps2pdf*. But note that *ps2pdf* will cut the page size
to the minimum one appears in the ps file, so it only works when all your plots have similar dimensions.
