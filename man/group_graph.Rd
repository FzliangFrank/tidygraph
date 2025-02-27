% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group.R
\name{group_graph}
\alias{group_graph}
\alias{group_components}
\alias{group_edge_betweenness}
\alias{group_fast_greedy}
\alias{group_infomap}
\alias{group_label_prop}
\alias{group_leading_eigen}
\alias{group_louvain}
\alias{group_optimal}
\alias{group_spinglass}
\alias{group_walktrap}
\alias{group_biconnected_component}
\title{Group nodes and edges based on community structure}
\usage{
group_components(type = "weak")

group_edge_betweenness(weights = NULL, directed = TRUE, n_groups = NULL)

group_fast_greedy(weights = NULL, n_groups = NULL)

group_infomap(weights = NULL, node_weights = NULL, trials = 10)

group_label_prop(weights = NULL, label = NULL, fixed = NULL)

group_leading_eigen(
  weights = NULL,
  steps = -1,
  label = NULL,
  options = igraph::arpack_defaults,
  n_groups = NULL
)

group_louvain(weights = NULL)

group_optimal(weights = NULL)

group_spinglass(weights = NULL, ...)

group_walktrap(weights = NULL, steps = 4, n_groups = NULL)

group_biconnected_component()
}
\arguments{
\item{type}{The type of component to find. Either \code{'weak'} or \code{'strong'}}

\item{weights}{The weight of the edges to use for the calculation. Will be
evaluated in the context of the edge data.}

\item{directed}{Should direction of edges be used for the calculations}

\item{n_groups}{Integer scalar, the desired number of communities. If too low or two high, then an error message is given.}

\item{node_weights}{The weight of the nodes to use for the calculation. Will
be evaluated in the context of the node data.}

\item{trials}{Number of times partition of the network should be attempted}

\item{label}{The initial groups of the nodes. Will be evaluated in the
context of the node data.}

\item{fixed}{A logical vector determining which nodes should keep their
initial groups. Will be evaluated in the context of the node data.}

\item{steps}{The number of steps in the random walks}

\item{options}{Settings passed on to \code{igraph::arpack()}}

\item{...}{arguments passed on to \code{\link[igraph:cluster_spinglass]{igraph::cluster_spinglass()}}}
}
\value{
a numeric vector with the membership for each node in the graph. The
enumeration happens in order based on group size progressing from the largest
to the smallest group
}
\description{
These functions are wrappers around the various clustering functions provided
by \code{igraph}. As with the other wrappers they automatically use the graph that
is being computed on, and otherwise passes on its arguments to the relevant
clustering function. The return value is always a numeric vector of group
memberships so that nodes or edges with the same number are part of the same
group. Grouping is predominantly made on nodes and currently the only
grouping of edges supported is biconnected components.
}
\section{Functions}{
\itemize{
\item \code{group_components()}: Group by connected compenents using \code{\link[igraph:components]{igraph::components()}}

\item \code{group_edge_betweenness()}: Group densely connected nodes using \code{\link[igraph:cluster_edge_betweenness]{igraph::cluster_edge_betweenness()}}

\item \code{group_fast_greedy()}: Group nodes by optimising modularity using \code{\link[igraph:cluster_fast_greedy]{igraph::cluster_fast_greedy()}}

\item \code{group_infomap()}: Group nodes by minimizing description length using \code{\link[igraph:cluster_infomap]{igraph::cluster_infomap()}}

\item \code{group_label_prop()}: Group nodes by propagating labels using \code{\link[igraph:cluster_label_prop]{igraph::cluster_label_prop()}}

\item \code{group_leading_eigen()}: Group nodes based on the leading eigenvector of the modularity matrix using \code{\link[igraph:cluster_leading_eigen]{igraph::cluster_leading_eigen()}}

\item \code{group_louvain()}: Group nodes by multilevel optimisation of modularity using \code{\link[igraph:cluster_louvain]{igraph::cluster_louvain()}}

\item \code{group_optimal()}: Group nodes by optimising the moldularity score using \code{\link[igraph:cluster_optimal]{igraph::cluster_optimal()}}

\item \code{group_spinglass()}: Group nodes using simulated annealing with \code{\link[igraph:cluster_spinglass]{igraph::cluster_spinglass()}}

\item \code{group_walktrap()}: Group nodes via short random walks using \code{\link[igraph:cluster_walktrap]{igraph::cluster_walktrap()}}

\item \code{group_biconnected_component()}: Group edges by their membership of the maximal binconnected components using \code{\link[igraph:biconnected_components]{igraph::biconnected_components()}}

}}
\examples{
create_notable('tutte') \%>\%
  activate(nodes) \%>\%
  mutate(group = group_infomap())

}
