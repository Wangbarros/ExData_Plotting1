power = read.table("household_power_consumption.txt",header = TRUE, sep = ";")

power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")

data = subset(power, Date >= a & Date <= b)

hist(as.numeric(as.character(data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
