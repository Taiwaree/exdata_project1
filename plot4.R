data <- subset(read.table("household_power_consumption.txt" , header = TRUE ,sep = ";" ), Date == '1/2/2007' | Date =='2/2/2007') 

data$datetime <- paste(data$Date, data$Time)


data$date.time <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S") 

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power)) 
data$Voltage <- as.numeric(as.character(data$Voltage))

data$Global_intensity <- as.numeric(as.character(data$Global_intensity))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))

data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
# top left plot
 plot(data$date.time,data$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = " ", type = 'l')
# top right plot
 plot(data$date.time,data$Voltage, ylab = ' Voltage', xlab = "datetime", type = 'l') 

# down left plot
 plot(data$date.time,data$Sub_metering_1, type = 'l' , ylab ='Energy sub metering' , xlab = 'day')
 lines(data$date.time,data$Sub_metering_2, type = 'l' , col ='red')
lines(data$date.time,data$Sub_metering_3, type = 'l' , col ='blue')
legend("topright", bty = "n", lty = 1 ,   col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# down right plot 
plot(data$date.time,data$Global_reactive_power, ylab = 'Global_reactive_power', xlab = "datetime", type = 'l')

dev.off()