dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

paramteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

numericData <- as.numeric(paramteredData$Global_active_power)

hist(numericData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()