power = read.table("household_power_consumption.txt",header = TRUE, sep = ";")

power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")

data = subset(power, Date >= a & Date <= b)

data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()