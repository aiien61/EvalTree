source('./R/configuration.R')

library(magrittr)
library(M4comp2018)

data("M4")

# defined functions
save_M4_plots <- function(gallery_path){
  # Store all time series plots of M4 dataset
  # 
  # Drawing each time series plot of M4 dataset and store to specified location
  # 
  # Args:
  #   gallery_path: [character] Location to store time plots
  #   
  # Returns:
  #
  tryCatch({
        for (i in 1:length(M4)) {
            jpeg(filename = sprintf(gallery_path, i))
            plot(ts(c(M4[[i]]$x, M4[[i]]$xx), 
                    start = start(M4[[i]]$x),
                    frequency=frequency(M4[[i]]$x)),
                 main=i, ylab='', col='red')
            
            lines(M4[[i]]$x, col='black', lwd=2)
            dev.off()
            
            if(i%%1000 == 0){
                print(crayon::cyan(sprintf('%d%% completed ', i/1000)))
            }
        }
    },
    warning = function(msg){
        message("Warning:")
        message(paste0(msg,"\n"))
        return(NULL)
    },
    error = function(e){
        message("Error:")
        message(paste0(e,"\n"))
        return(NA)
    }
  )
}

hrs <- function(u) {
    # conver hours to seconds
    x <- u * 3600
    return(x)
}

str_to_wdays <- function(s){
    # convert date strings to weekdays
    wdays <- weekdays(lubridate::as_date(s))
    return(wdays)
}


# function for loading M4 dataset
gen <- function(series, output=FALSE){
    # Load specified M4 dataset
    # 
    # Specify series, then load the trainin and test sets of the series
    #
    # Args:
    #   series: [numeric] Series number of M4 dataset
    #   output: [logical] Output file if TRUE
    #
    # Returns:
    #   A list containing two data.frames, one is training set and the other
    #     is test set
    #
    tryCatch({
        # top 25 forecasters
        pred <- M4[[series]]$pt_ff %>% t()
        colnames(pred) <- paste0('ID_', submission_info$ID[1:25])
        
        if(is.null(func[[series]])){
            collector <- list()
            collector[['train']] <- data.frame(actual=M4[[series]]$x)
            collector[['test']] <- data.frame(actual=M4[[series]]$xx, pred)
            warning('This series did not processed.\n
                    There is no corresponding date/time in the data.frame')
        }else{
            f <- match.fun(func[[series]])
        }
        
        # output
        if(output){
            dir.create(sprintf('./data/%d', series))
            f(series, pred)$train %>% 
              write.csv(., sprintf('./data/%d/train%d.csv', series, series))
            f(series, pred)$test %>% 
              write.csv(., sprintf('./data/%d/test%d.csv', series, series))   
        }
        return(f(series, pred))
    },
    warning = function(msg){
        message("Warning:")
        message(paste0(msg,"\n"))
        return(NULL)
    },
    error = function(e){
        message("Error:")
        message(paste0(e,"\n"))
        return(NA)
    })
}


# defined processing function for series
func <- list()
func[[99998]] <- function(series,forecasters){
    # generate training set and test set of #99998
    # training set starts at 2017-01-01 12:00
    # test set starts at 2017-02-10 12:00  
    collector <- list()
    
    # training set
    s <- strptime('2017-01-01 12:00', '%Y-%m-%d %H:%M')
    dates <- sapply(seq_along(M4[[series]]$x)-1, FUN=hrs) + s
    collector[['train']] <- stringr::str_split_fixed(dates, ' ', 2) %>%
        data.frame(dates, ., str_to_wdays(dates), M4[[series]]$x) %>% 
        set_colnames(., c('datetime', 'date', 'time', 'weekday', 'actual'))
    
    # test set
    s <- strptime('2017-02-10 12:00', '%Y-%m-%d %H:%M')
    dates <- sapply(seq_along(M4[[series]]$xx)-1, FUN=hrs) + s
    collector[['test']] <- stringr::str_split_fixed(dates, ' ', 2) %>%
        data.frame(dates, ., str_to_wdays(dates), M4[[series]]$xx) %>%
        set_colnames(., c('datetime', 'date', 'time', 'weekday', 'actual')) %>% 
        cbind(., forecasters)
    
    return(collector)
}
func[[90452]] <- function(series, forecasters){
    # generate training set and test set of #90452
    # training set starts at 1997-04
    # test set starts at 2015-04
    collector <- list()
    
    # training
    s <- lubridate::as_date(lubridate::parse_date_time('1997-04', '%Y-%m'))
    dates <- seq(s, by='month', length.out = M4[[90452]]$n)
    collector[['train']] <- data.frame(date = dates, actual = M4[[90452]]$x)
    
    # test
    s <- lubridate::as_date(lubridate::parse_date_time('2015-12', '%Y-%m'))
    dates <- seq(s, by='month', length.out=M4[[90452]]$h)
    
    # top 25 forecasters
    collector[['test']] <- data.frame(date=dates,
                                      actual=M4[[90452]]$xx,
                                      forecasters)
    
    return(collector)
}





