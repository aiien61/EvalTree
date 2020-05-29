source('./R/configuration.R')

# defined function
tsplot <- function(df, ticks, val_cols){
    # Plot multiple series time plot
    #
    # Draw time series plot of df, and df must have columns for xtick and
    #   groups of series line
    # 
    # Args:
    #   df: [data.frame] Time series data containing at leat one column for
    #       value, one column for xaxis ticks
    #   ticks: [character] Column name of x axis ticks
    #   val_cols: [vector] Set of column names, each one for each line
    #
    # Returns:
    #   
    df <- df[, c(ticks, val_cols)] %>%
        tidyr::gather(., val_cols, key='series', value='value')
    
    linetypes <- c("solid", rep('dashed', length(val_cols)-1))
    linesizes <- c(1.5, rep(0.8, length(val_cols)-1))
    
    ggplot2::ggplot(df,
        ggplot2::aes(x=datetime, y=value, group=series, color=series)) +
        ggplot2::geom_line(ggplot2::aes(linetype=series, size=series)) +
        ggplot2::scale_linetype_manual(values=linetypes) +
        ggplot2::scale_size_manual(values=linesizes)
}

