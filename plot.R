source('./R/preprocess.R')

treePlot <- function(df, series, type){
    # Storing tree plot of all forecasters of the series
    #
    # Specify type of tree, then store tree plot of all forecasters of 
    #   the series
    #
    # Args:
    #   df: [data.frame] A data.frame to be used to build a tree
    #   series: [numeric] Series number
    #   type: [character] Type of EvalTree. 'factor' or 'dummy'
    # 
    # Returns:
    # 
    tryCatch({
        path <- sprintf('./result/figs/tree/%d/%s', series, type)
        dir.create(path,recursive = TRUE)
        
        for(id in names(df)[stringr::str_detect(names(df), "ID_")]){
            dtree <- factor_tree(df, 'actual', c('weekday', 'hour'), id)$tree
            name <- strsplit(id, split='_')[[1]][2]
            
            jpeg(sprintf(file.path(path, '%s.png'), name))
            rpart.plot::rpart.plot(dtree)
            dev.off()
        }
    },
    error = function(e){message(e)}  
    )
}

treePlot(test99998, 99998, 'factor')
