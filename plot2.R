#### Creates plot 2

#### Initialisation

rm(list=ls())
gc()

setwd() # set working directory here

#### Read data

data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=T)

#### Format data

dates <- as.Date(data$Date,"%d/%m/%Y")
data$Date <- dates

# select only dates between 2007-02-01 and 2007-02-02

day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")

subset <- data[data$Date >= day1 & data$Date <= day2,]

# Create new column called datetime and convert to date/time object

datetime <- paste(subset$Date, subset$Time, sep = " ")
datetimeformatted <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")
subset <- cbind(datetimeformatted, subset)

#### Create and output plots

# PLOT2: line graph

png("plot2.png", width = 480, height = 480)
plot(subset$datetimeformatted, as.numeric(as.character(subset$Global_active_power)), type="l", xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()
