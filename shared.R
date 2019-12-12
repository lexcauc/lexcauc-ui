# Common libraries and knitr settings

library(lingtypology)
library(DT)
library(tidyverse)
library(dplyr)
knitr::opts_chunk$set(echo=FALSE, message=FALSE)

# Read CSV database files (either locally or globally)

read.csv("https://raw.githubusercontent.com/lexcauc/lexcauc-db/master/lexcauc-concepts.csv", stringsAsFactors = FALSE) -> concepts
read.csv("https://raw.githubusercontent.com/lexcauc/lexcauc-db/master/forms.csv", stringsAsFactors = FALSE) -> forms
read_csv("https://raw.githubusercontent.com/lexcauc/lexcauc-db/master/languages.csv", col_types = "ccccfddc") -> langs
# read.csv("../lexcauc-db/lexcauc-concepts.csv", stringsAsFactors = FALSE) -> concepts
# read.csv("../lexcauc-db/forms.csv", stringsAsFactors = FALSE) -> forms
# read_csv("../lexcauc-db/languages.csv", col_types = "ccccfddc") -> langs