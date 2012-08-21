#!/usr/bin/env r
## comparable_groups_30/30-FriJul27213619_12_5/train12_5-test_10-FriJul27213619.table

## create tables named "t12_5_10_FriJul27213619", 
sup_dir <- "comparable_groups"

group_dirs <- list.files(path=sup_dir, pattern="*Jul*")
for (i in seq(along=group_dirs)) {
    full_g_dir <- paste(sup_dir, c("/"), group_dirs[[i]], sep='')
    files <- list.files (path=full_g_dir, pattern="*table",)

    for (j in seq(along=files)) {
        var_name <- files[j]
        var_name <- gsub("(-double)?\\.table", "", var_name, perl=TRUE)
        var_name <- gsub("rain", "", var_name, perl=TRUE)
        var_name <- gsub("test_", "", var_name, perl=TRUE)
        var_name <- gsub("-", "_", var_name, perl=TRUE)
        #        print (var_name)
        x <- read.table (paste(full_g_dir, c("/"), files[j], sep=''), sep="\t", header=F)
        assign (var_name, x);
    }
}
rm(group_dirs,sup_dir,full_g_dir,files,i,j,var_name,x)
#table_list <- ls()
