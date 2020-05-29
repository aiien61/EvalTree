source('./R/configuration.R')
source('./R/data.R')

factor_tree <- function(df, y, predictors, forecaster){
    df <- df[, c(y, predictors, forecaster)]
    df[, 'error'] <- df[, y] - df[, forecaster]
  
    params <- list(minsplit=2, minbucket=1, cp=0)
    dtree <- rpart::rpart(formula=error ~.,
                          data=df[, c(predictors, 'error')],
                          method='anova',
                          control=do.call(rpart::rpart.control, params))
  
    return(list('df'=df, 'tree'=dtree))
}