#
# This function saves a ggplot with the same name as the object.
#
#
#

ggsave_it <- function(x, plot = ggplot2::last_plot(), ...){
  if(!dir.exists("images")){
    dir.create("images")
  }
  ggplot2::ggsave(filename = paste0("images/", deparse(substitute(x)), ".png"), plot = plot, ...)
}

#
# This function saves a dataset with the same name as the object.
#
#
#

save_it <- function(x){
  if(!dir.exists("data")){
    dir.create("data")
  }
  save(x, file = paste0("data/", deparse(substitute(x)), ".Rdata"))
}

#
# This function loads a dataset with the same name as the object.
#
#
#

load_it <- function(x) {
  get(load(x))
}


#
# This function standardizes a variable from 0 to 1.
#
#
#

range01 <- function(x){
  (x - min(x, na.rm = T)) / (max(x, na.rm = T) - min(x, na.rm = T))
}


#
# This function creates a tidy template.
#
#
#

open_template <- function(filename = "Untitled1") {

tidypath_fragment <- "/tidytemplate/rmarkdown/templates/template-name/skeleton/skeleton.Rmd"

tidypath <- paste0(.libPaths(), tidypath_fragment)[1]

wdpath <- paste0(getwd(), "/", filename, ".Rmd")

if (file.exists(tidypath)) {
  file.copy(from = tidypath, to = wdpath)
  file.edit(wdpath)
  }
}


#
#
# Get Stars from P-Values
#
#

get_stars <- function (pval) {
  dplyr::case_when(
    is.na(pval) ~ "", 
    pval < 0.001 ~ "***", 
    pval < 0.01 ~ "**", 
    pval < 0.05 ~ "*", 
    pval < 0.10 ~ "^", 
    TRUE ~ "")
}