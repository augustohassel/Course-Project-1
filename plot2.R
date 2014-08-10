# Load the Data Set
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Subset it with the date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataFull <- data[which(data$Date =="2007-02-01" | data$Date == "2007-02-02"), ]

timeFull <- paste(as.Date(dataFull$Date), dataFull$Time)
dataFull$Time <- strptime(timeFull, format = "%Y-%m-%d %H:%M:%S")

# Making the plot number 2
if(!file.exists("./course-project-1")){dir.create("./course-project-1")}

plot(dataFull$Time, dataFull$Global_active_power, type = "l", xlab = "", 
        ylab = "Global Active Power (kilowatts)")

dev.copy(png, file ="./course-project-1/plot2.png", width = 480, height = 480)
dev.off()
