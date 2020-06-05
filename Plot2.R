library(dplyr)
power <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
feb <- filter(power, Date %in% c("1/2/2007" , "2/2/2007"))

datetime <- strptime(paste(feb$Date, feb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(feb$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()