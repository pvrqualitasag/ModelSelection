% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collect_olsrr_results.R
\name{collect_ols_results}
\alias{collect_ols_results}
\title{Collect Results from olsrr Modelselection Across Sample Datasets}
\usage{
collect_ols_results(pvec_sample, ps_response)
}
\arguments{
\item{pvec_sample}{vector of paths to data samples}

\item{ps_response}{name of the response variable}
}
\value{
tbl_result tibble with results of the model selection for each sample.
}
\description{
For very large datasets model selection is done on smaller subsamples of the
complete dataset. Given the subsamples, model selection is run and a set
of results is collected.
}
\details{
---
title: "Collection of olsrr Result Across Samples"
date:  "2020-04-27"
---


Currently model selection is done using \code{olsrr::ols_step_backward_aic()}
}
\examples{
\dontrun{
n_nr_sample <- 10
n_sample_size <- 30
# samples from mtcars and write samples to files in tmpdir
tmpdir <- tempdir()
cat(" * Sample directory: ", tmpdir, "\n")
vec_sample_files <- sapply(1:n_nr_sample,
                           function(x) paste0("mtcars_sample_", x, ".csv", collapse = ""),
                           USE.NAMES = FALSE)
vec_sample_path <- file.path(tmpdir, vec_sample_files)
set.seed(321)
for (i in 1:n_nr_sample){
  cat(" * Generate sample ", i, " ...\n")
  cur_sample <- dplyr::sample_n(mtcars, n_sample_size, replace = TRUE)
  readr::write_csv(cur_sample, path = vec_sample_path[i])
}
collect_ols_results(pvec_sample = vec_sample_path, ps_response = "mpg")
}

}
