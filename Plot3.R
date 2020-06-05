library(dplyr)
power <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
feb <- filter(power, Date %in% c("1/2/2007" , "2/2/2007"))

datetime <- strptime(paste(feb$Date, feb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
SM1 <- feb$Sub_metering_1
SM2 <- feb$Sub_metering_2
SM3 <- feb$Sub_metering_3

png("plot3.png", width=480, height=480)
plot(datetime, SM1, type="l", xlab="", ylab="Energy Sub Metering")
lines(datetime, SM2, type="l", col = "red")
lines(datetime, SM3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2, 
       col = c("black","red","blue"))
dev.off()