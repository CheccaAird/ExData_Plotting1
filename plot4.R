dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

paramteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

numericActiveData <- as.numeric(paramteredData$Global_active_power)
numericReactiveData <- as.numeric(paramteredData$Global_reactive_power)
numericVoltageData <- as.numeric(paramteredData$Voltage)

subMeter1 <- as.numeric(paramteredData$Sub_metering_1)
subMeter2 <- as.numeric(paramteredData$Sub_metering_2)
subMeter3 <- as.numeric(paramteredData$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(numericActiveData,type="l" ,ylab="Global Active Power (kilowatts)", xlab="")

plot(numericVoltageData,type="l" ,ylab="Voltage", xlab="datetime")

plot(subMeter1, type = "l", ylab="Energy sub metering", xlab = "", col="black")
lines(subMeter2, type = "l", ylab="Energy sub metering", xlab = "", col="red")
lines(subMeter3, type = "l", ylab="Energy sub metering", xlab = "", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(numericReactiveData,type="l" ,ylab="Global_rective_power", xlab="datetime")


dev.copy(png, file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
dev.off()




