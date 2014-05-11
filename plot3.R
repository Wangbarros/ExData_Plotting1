power = read.table("household_power_consumption.txt",header = TRUE, sep = ";")

power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")

data = subset(power, Date >= a & Date <= b)
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),  type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_2)), col = "red")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_3)), col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
