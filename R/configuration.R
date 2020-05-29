### install necessary packages
pkgs <- c('M4comp2018', # data
          'magrittr', 'rlist', 'crayon', 'modules',
          'stringr', 'dplyr', 'tidyr', 'lubridate', 'fastDummies',
          'rpart', 'rpart.utils',
          'ggplot2', 'rpart.plot',
          'openxlsx')
existing <- as.character(installed.packages()[,1])
for(pkg in pkgs[!(pkgs %in% existing)]) install.packages(pkg)

### remove unnecessary objects
rm(pkg, existing, pkgs)