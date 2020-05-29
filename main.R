source('./R/evaltree.R')
source('./R/preprocess.R')

################################################################################
#                                     99998
################################################################################

# factor tree
trees <- list()
for(id in names(test99998)[stringr::str_detect(names(test99998), "ID_")]){
    trees[[id]] <- list(
        'df'=factor_tree(test99998, 'actual', c('weekday', 'hour'), id)$df,
        'tree'=factor_tree(test99998, 'actual', c('weekday', 'hour'), id)$tree)
}
