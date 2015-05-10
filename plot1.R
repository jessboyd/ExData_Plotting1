#### Creates plot 1

#### Initialisation

rm(list=ls())
gc()

setwd() # set working directory here

#### Read data

data <- read.table("exdata-data-household_power_consumption (1)/household_power_consumption.txt", sep=";", dec = ".", header=T)

#### Format data

dates <- as.Date(data$Date,"%d/%m/%Y")
data$Date <- dates

# select only dates between 2007-02-01 and 2007-02-02

day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")

subset <- data[data$Date >= day1 & data$Date <= day2,]

#### Create and output plots

# PLOT 1: Draw histogram

png("plot1.png", width = 480, height = 480)
hist((as.numeric(as.character(subset$Global_active_power))), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
