##
## Common file for all functions used for plotting. This will be used in plotting 
## all four plots. Plot 2,3 will be re-used in plot4
##

### If data has not been read, then read and filter it.
### See read_data.R for implementation
if(!("filtered" %in% objects())){
  source("read_data.R")
}

plot1 <- function(){
  hist(as.numeric(filtered$Global_active_power), 
       xlab="Global Active Power (kilowatts)", 
       col = "red",
       main = "Global Active Power")
}

plot2 <- function(units=TRUE){
  if(units){
    labelY = "Global Active Power (kilowatts)"
  }
  else {
    labelY = "Global Active Power"
  }
  
  with(filtered, 
       plot(as.factor(DateTime), 
            Global_active_power,
            type="n",
            xaxt="n",
            ylab = labelY))
  with(filtered, 
       lines(as.factor(DateTime), 
             Global_active_power))
  axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
}

plot3 <- function(){
  with(filtered, 
       plot(as.factor(DateTime), 
            Sub_metering_1,
            type="n",
            xaxt="n",
            ylab = "Energy sub metering"))
  with(filtered, 
       lines(as.factor(DateTime), 
             Sub_metering_1))
  with(filtered, 
       lines(as.factor(DateTime), 
             Sub_metering_2, col="red"))
  with(filtered, 
       lines(as.factor(DateTime), 
             Sub_metering_3, col="blue"))
  axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

plot4 <- function(){
  par(mfrow = c(2, 2))
  plot2(FALSE)
  with(filtered, 
       plot(as.factor(DateTime), 
            Voltage,
            type="n",
            xaxt="n",
            ylab = "Voltage",
            xlab = "datetime"))
  with(filtered, 
       lines(as.factor(DateTime), 
             Voltage))
  axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  
  plot3()
  
  with(filtered, 
       plot(as.factor(DateTime), 
            Global_reactive_power,
            type="n",
            xaxt="n",
            ylab = "Global_reactive_power",
            xlab = "datetime"))
  with(filtered, 
       lines(as.factor(DateTime), 
             Global_reactive_power))
  axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
}