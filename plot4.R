datafile <- "household_power_consumption.txt"
mycols <- rep("NULL", 9); mycols[c(1,2,3,4,5,7,8,9)] <- NA
initialframe <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", colClasses=mycols) #imports global active power
correctframe <- initialframe[initialframe$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(correctframe$Date, correctframe$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(correctframe, {
## 1ST CHART ----------------
plot(datetime, as.numeric(correctframe$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power", col = "black")
        
## 2ND CHART ---------------------        
plot(datetime, as.numeric(correctframe$Voltage), type = "l", lwd = 0.5, ylab = "Voltage", xlab="datetime", col = "black")

## 3RD CHART ------------------
plot(datetime, as.numeric(correctframe$Sub_metering_1), type = "l",  xlab = "", ylab = "Energy sub metering", col = "black")
lines(datetime, as.numeric(correctframe$Sub_metering_2), type = "l", col = "red", xlab = "")
lines(datetime, as.numeric(correctframe$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lty=1, bty = "n", lwd=1,  col=c("black", "red", "blue"))


## 4TH CHART ------------------
plot(datetime, as.numeric(correctframe$Global_reactive_power, xlab = "datetime"), lwd = 0.5, type = "l", ylab = "Global_reactive_power", col = "black")
                }
)

dev.off()

## -------------
testdata <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", nrow = 5) 
## ----------------
