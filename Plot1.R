library(dplyr)
power <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
feb <- filter(power, Date %in% c("1/2/2007" , "2/2/2007"))

GAP <- as.numeric(feb$Global_active_power)

png("plot1.png", width=480, height=480)
hist(GAP, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()