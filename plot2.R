# Exploratory data analysis: creating and writing plots
# Course project 1

##########################################
########### Read and clean data###########
##########################################

consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

conspt <- subset(consumption, consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")


###########################################
############# Plot 2 ######################
###########################################

library(datasets)
library(chron)

conspt$Global_active_power <- as.numeric(conspt$Global_active_power)
conspt$dateTime <- chron(dates=as.character(conspt$Date),
                       times=as.character(conspt$Time),format=c("d/m/y", "h:m:s"))

plot(Global_active_power ~ dateTime, conspt,xlab="",type="l", ylab="Global Active Power (kilowatts)",xaxt="n")
day.names <- list(c("Thu", "Fri","Sat"))[[1]]
day.starts <- list(c(conspt$dateTime[1],conspt$dateTime[1441],conspt$dateTime[2880]))[[1]]
axis(1, at=day.starts, labels=day.names)

dev.copy(png, file = "plot2.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()

