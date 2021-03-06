#### Creates plot 4

#### Initialisation

rm(list=ls())
gc()

setwd() # set working directory here

#### Read data

data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", dec = ".", header=T)

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

# PLOT4: multiple plots
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2)) # all plots on one page 
plot(subset$datetimeformatted, as.numeric(as.character(subset$Global_active_power)), type="l", xlab = "", ylab= "Global Active Power (kilowatts)")
plot(subset$datetimeformatted, as.numeric(as.character(subset$Voltage)), type="l", xlab = "", ylab= "Voltage")
plot(subset$datetimeformatted, as.numeric(as.character(subset$Sub_metering_1)), type = "l", ylab="Energy Sub Metering", xlab="")
lines(subset$datetimeformatted, as.numeric(as.character(subset$Sub_metering_2)), col = "red")
lines(subset$datetimeformatted, as.numeric(as.character(subset$Sub_metering_3)), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
plot(subset$datetimeformatted, as.numeric(as.character(subset$Global_reactive_power)), type = "l", ylab = "Global Reactive Power", xlab = "")
dev.off()
