#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)

library(parallel)
library(rmarkdown)
clean_tmpfiles_mod <- function() {
  message("Calling clean_tmpfiles_mod()")
}

assignInNamespace("clean_tmpfiles", clean_tmpfiles_mod, ns = "rmarkdown")

# Detect number of cores
no_cores <- detectCores() - 1

# Make cluster
cl <- makeCluster(no_cores, type="FORK")

# List files to be built
# files <- c('index.Rmd','concepts.Rmd','languages.Rmd')

# Apply the render_site function to each file in parallel
invisible(parLapply(cl, args, function(x){render(x,output_dir = "./_site")}))
# lapply(args, function(x){render(x,output_dir = "./_site")})

# Stop cluster
stopCluster(cl)
