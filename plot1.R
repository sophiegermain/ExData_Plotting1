# Exploratory data analysis: creating and writing plots
# Course project 1

##########################################
########### Read and clean data###########
##########################################

consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

conspt <- subset(consumption, consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")


###########################################
############# Plot 1 ######################
###########################################

library(datasets)
conspt$Global_active_power <- as.numeric(conspt$Global_active_power)
hist(conspt$Global_active_power, col=554, xlab="Global Active Power (kilowatts)",main ="Global Active Power") 
dev.copy(png, file = "plot1.png", width = 480, height = 480, units="px") ## Copy my plot to a PNG file
dev.off()

