# load test set of #99998
test99998 <- read.csv('./data/99998/test99998.csv', row.names = 1L)

# add new column 'hour' extracting from column 'time'
stringr::str_split_fixed(test99998$time, pattern=':', n=3)[, 1] %>% 
  factor() -> test99998[, 'hour']