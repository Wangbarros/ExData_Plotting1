power = read.table("household_power_consumption.txt",header = TRUE, sep = ";")

power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")

data = subset(power, Date >= a & Date <= b)

data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))

hist(as.numeric(as.character(data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),  type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_2)), col = "red")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_3)), col = "blue")
plot(data$DateTime,as.numeric(as.character(data$Global_reactive_power)),  type = "l", xlab = "", ylab = "Global Reactive Power (kilowatts)")

dev.copy(png, file = "plot4.png")
dev.off()

