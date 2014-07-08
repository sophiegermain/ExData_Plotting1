# Exploratory data analysis: creating and writing plots
# Course project 1

##########################################
########### Read and clean data###########
##########################################

consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

conspt <- subset(consumption, consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")


###########################################
############# Plot 4 ######################
###########################################

library(datasets)
library(chron)

conspt$dateTime <- chron(dates=as.character(conspt$Date),
                         times=as.character(conspt$Time),format=c("d/m/y", "h:m:s"))

par(mfrow = c(2, 2))

with(conspt, {
  
  #Top left plot
  plot(Global_active_power ~ dateTime, conspt,xlab="",type="l", ylab="Global Active Power",xaxt="n")
  day.names <- list(c("Thu", "Fri","Sat"))[[1]]
  day.starts <- list(c(conspt$dateTime[1],conspt$dateTime[1441],conspt$dateTime[2880]))[[1]]
  axis(1, at=day.starts, labels=day.names)
  
  #Top right plot
  plot(Voltage ~ dateTime, conspt,type="l", ylab="Voltage",xlab="datetime",xaxt="n")
  day.names <- list(c("Thu", "Fri","Sat"))[[1]]
  day.starts <- list(c(conspt$dateTime[1],conspt$dateTime[1441],conspt$dateTime[2880]))[[1]]
  axis(1, at=day.starts, labels=day.names)
  
  #Bottom left plot
  plot(Sub_metering_1 ~ dateTime, conspt,xlab="",type="l", ylab="Energy sub metering",xaxt="n",col=c(1,554,28))
  day.names <- list(c("Thu", "Fri","Sat"))[[1]]
  day.starts <- list(c(conspt$dateTime[1],conspt$dateTime[1441],conspt$dateTime[2880]))[[1]]
  axis(1, at=day.starts, labels=day.names)
  lines(conspt$dateTime,conspt$Sub_metering_1,type = "l")
  lines(conspt$dateTime,conspt$Sub_metering_2,col = 554,type = "l")
  lines(conspt$dateTime,conspt$Sub_metering_3,col = 28,type = "l")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c(1,554,28),lty=c(1,1,1),cex=0.5,bty="n", y.intersp=0.5)
  
  
  #Bottom right plot
  plot(Global_reactive_power ~ dateTime, conspt,type="l",ylab= "Global_reactive_power",xlab="datetime",xaxt="n")
  day.names <- list(c("Thu", "Fri","Sat"))[[1]]
  day.starts <- list(c(conspt$dateTime[1],conspt$dateTime[1441],conspt$dateTime[2880]))[[1]]
  axis(1, at=day.starts, labels=day.names)
})

dev.copy(png, file = "plot4.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()

