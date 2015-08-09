## -------------------------------
# he dataset has 2,075,259 rows and 9 columns. 
# 
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than reading in the entire dataset 
#and subsetting to those dates.
# 
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the
#strptime() and as.Date() functions.
# 
# Note that in this dataset missing values are coded as ?.


datafile <- "household_power_consumption.txt"
mycols <- rep("NULL", 9); mycols[c(1,3)] <- NA
cdata <- read.table(datafile, stringsAsFactors = FALSE, header = TRUE, dec = ".", sep = ";", colClasses=mycols) #imports global active power
csub <- cdata[cdata$Date %in% c("1/2/2007","2/2/2007") ,]
test <- csub[csub$Global_active_power != "?",]
cleanedpower <- as.numeric(test[,2])
png("plot1.png", width=480, height=480)
hist(cleanedpower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", xim = c(0,6), ylim = c(0,1200))
dev.off()

