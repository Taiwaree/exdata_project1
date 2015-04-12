#plot 3

data <- subset(read.table("household_power_consumption.txt" , header = TRUE ,sep = ";" ), Date == '1/2/2007' | Date =='2/2/2007') 

data$datetime <- paste(data$Date, data$Time)

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$date.time <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))

data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

str(data)

# create project 1 plot 3
png(filename = "plot3.png", width=480, height=480)
plot(data$date.time,data$Sub_metering_1, type = 'l' , ylab ='Energy sub metering' , xlab = ' ')
lines(data$date.time,data$Sub_metering_2, type = 'l' , col ='red')
lines(data$date.time,data$Sub_metering_3, type = 'l' , col ='blue')

legend("topright",  lty = 1 ,    col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()