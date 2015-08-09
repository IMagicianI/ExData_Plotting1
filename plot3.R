datafile <- "household_power_consumption.txt"
mycols <- rep("NULL", 9); mycols[c(1,2,7,8,9)] <- NA
initialframe <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", colClasses=mycols) #imports global active power
correctframe <- initialframe[initialframe$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(correctframe$Date, correctframe$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)

plot(datetime, as.numeric(correctframe$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab="", col = "black")
lines(datetime, as.numeric(correctframe$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(correctframe$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

dev.off()

## -------------
testdata <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", nrow = 5) 
## ----------------
