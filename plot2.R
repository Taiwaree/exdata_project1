
#plot 2 

 data <- subset(read.table("household_power_consumption.txt" , header = TRUE ,sep = ";" ), Date == '1/2/2007' | Date =='2/2/2007') 

 data$datetime <- paste(data$Date, data$Time)

 data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

 data$date.time <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")

 str(data)

 # create project 1 plot 2

 png(filename = "plot2.png", width=480, height=480)

 plot(data$date.time,data$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = ' ', type = 'l')
 dev.off()