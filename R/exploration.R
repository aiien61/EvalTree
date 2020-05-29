source('./R/configuration.R')
source('./R/data.R')
source('./R/graphics.R')

# using histogram to explore the peaks of #99998
ggplot2::qplot(sort(gen(99998)$train$actual), geom="histogram") +
  ggplot2::labs(x='value', y='frequency', title='historgram of #99998')

# peaks are roughly greater than 200
which(gen(99998)$train$actual > 200) %>% 
  gen(99998)$train[.,]

# plot test period of series #99998 with forecasts
tsplot(gen(99998)$test,
       ticks='datetime', val_cols=c('actual', 'ID_118', 'ID_245'))
