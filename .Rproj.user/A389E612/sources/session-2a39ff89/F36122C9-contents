pkgs<-c("httr", "jsonlite", "dplyr", 
"tidyr", "lubridate", "ggplot2", "ggpubr", "corrplot", "broom")
install_if_missing <- function(p) {
  if (!requireNamespace(p, quietly = TRUE)) install.packages(p)
}
invisible(sapply(pkgs, install_if_missing))