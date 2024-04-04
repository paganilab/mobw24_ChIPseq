# Load installed packages with the "library()" function
library(dplyr)
library(googledrive)

# Load files
files <- drive_ls(path="MOBW2024_uploadata")

#Is it OK to cache OAuth access credentials in the folder ~/Library/Caches/gargle between R sessions?
#  1: Yes
#2: No
#Selection: Yes
#Enter a number between 1 and 2, or enter 0 to exit.
#Selection: 1
#Waiting for authentication in browser...

#Press Esc/Ctrl + C to abort
#Authentication complete.

# File paths with URL
counts <- files[files$name == "raw_counts_chr12.matrix",] %>% drive_read_string() %>% read.table(text = ., sep="\t") %>% as.data.frame()

samples <- files[files$name == "colData.txt",] %>% drive_read_string() %>% read.table(text = ., sep="\t") %>% as.data.frame()

