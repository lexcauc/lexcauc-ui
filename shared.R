# Read CSV database files (either locally or globally)

read.csv("https://raw.githubusercontent.com/lexcauc/lexcauc-db/master/lexcauc-concepts.csv",stringsAsFactors = FALSE) -> concepts
read.csv("https://raw.githubusercontent.com/lexcauc/lexcauc-db/master/forms.csv",stringsAsFactors = FALSE) -> forms
read.csv("https://raw.githubusercontent.com/lexcauc/lexcauc-db/master/languages.csv",stringsAsFactors = FALSE) -> langs
#read.csv("../lexcauc-db/lexcauc-concepts.csv",stringsAsFactors = FALSE) -> concepts
#read.csv("../lexcauc-db/forms.csv",stringsAsFactors = FALSE) -> forms
#read.csv("../lexcauc-db/languages.csv",stringsAsFactors = FALSE) -> langs

# Common libraries and knitr settings

library(DT)
library(tidyverse)
library(dplyr)
knitr::opts_chunk$set(echo=FALSE, message=FALSE)