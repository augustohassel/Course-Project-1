# Load the Data Set
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Subset it with the date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataFull <- data[which(data$Date =="2007-02-01" | data$Date == "2007-02-02"), ]

timeFull <- paste(as.Date(dataFull$Date), dataFull$Time)
dataFull$Time <- strptime(timeFull, format = "%Y-%m-%d %H:%M:%S")

# Making the plot number 3
if(!file.exists("./course-project-1")){dir.create("./course-project-1")}

plot(dataFull$Time, dataFull$Sub_metering_1, type = "l", xlab = "", 
        ylab = "Energy sub metering")
lines(dataFull$Time, dataFull$Sub_metering_2, col = "red")
lines(dataFull$Time, dataFull$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file ="./course-project-1/plot3.png", width = 480, height = 480)
dev.off()
