library(dplyr)
power <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
feb <- filter(power, Date %in% c("1/2/2007" , "2/2/2007"))

GAP <- as.numeric(feb$Global_active_power)
VOLT <- as.numeric(feb$Voltage)
datetime <- strptime(paste(feb$Date, feb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
SM1 <- feb$Sub_metering_1 ; SM2 <- feb$Sub_metering_2 ; SM3 <- feb$Sub_metering_3
GRP <- as.numeric(feb$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
#1        
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#2
plot(datetime, VOLT, type="l", xlab="", ylab="Voltage")
#3       
plot(datetime, SM1, type="l", xlab="", ylab="Energy Sub Metering")
        lines(datetime, SM2, type="l", col = "red")
        lines(datetime, SM3, type="l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1, lwd = 2, 
               col = c("black","red","blue"), 
               bty = "o")
#4      
plot(datetime, GRP, type="l", xlab="", ylab="Global Reactive Power")

dev.off()