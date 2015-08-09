datafile <- "household_power_consumption.txt"
mycols <- rep("NULL", 9); mycols[c(1,2,3)] <- NA
initialframe <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", colClasses=mycols) #imports global active power
date_subframe <- initialframe[initialframe$Date %in% c("1/2/2007","2/2/2007") ,]
correctframe <- date_subframe[date_subframe$Global_active_power != "?",]


cleanedpower <- as.numeric(correctframe[,3])
datetime <- strptime(paste(correctframe$Date, correctframe$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)

plot(datetime, cleanedpower, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

## -------------
testdata <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", nrow = 5) 
## ----------------
