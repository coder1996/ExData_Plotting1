## Reads data from data file
data <- read.csv("household_power_consumption.txt", 
                 sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)
## Filter by date
filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Create a new column DateTime to store combination of date and time
filtered$DateTime <- apply(filtered, 1, FUN=function(x)paste(x[1],x[2]))