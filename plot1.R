#plot 1 


data <- subset(read.table("household_power_consumption.txt" , header = TRUE ,sep = ";" ), Date == '1/2/2007' | Date =='2/2/2007') 

str(data)   #check data type

data$Date <- strptime(data$Date,"%d/%m/%Y")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

str(data)

# create project 1 plot 1
png(filename = "plot1.png", width=480, height=480)

hist.data <- hist(data$Global_active_power, main = paste("Global Active Power"), xlab = 'Global Active Power (kilowatts)', col= 'red' )



dev.off()