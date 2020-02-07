top_dir <- getwd()
location <- 'raw_csv_data'
setwd(location)

library(readr)
# raw_data_pop <- read.csv2('FD_INDCVIZA_2016.csv')
raw_data_hous <- read.csv2('FD_LOGEMTZA_2016.csv')

iris_values <- unique(raw_data_hous$IRIS)

processed_data <- data.frame(IRIS = iris_values)
remove(iris_values)

population = c()wa

for (i in 1:nrow(processed_data)){
  population <- append(population, 0)
}
remove(i)
processed_data <- cbind(processed_data, population)
remove(population)

for (i in 1:nrow(raw_data_hous)){
  print(i)
  processing <- raw_data_hous[i,]
  pop_to_add <- as.numeric(levels(processing$INPER))[processing$INPER]
  if (is.na(pop_to_add)){
    pop_to_add <- 0
  }
  processed_data[which(processed_data$IRIS == processing$IRIS), 2] <- processed_data[which(processed_data$IRIS == processing$IRIS), 2] + pop_to_add  
}

setwd('..')
getwd()

write.csv(processed_data, "pop_by_iris.csv")
