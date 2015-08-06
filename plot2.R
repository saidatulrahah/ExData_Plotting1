## Getting full dataset

data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",  quote='\"')


## Subsetting the data
SetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
View(SetData)
write.table(SetData, "SubSet.txt")
SetData$Date <- as.Date(SetData$Date, format="%d/%m/%Y") #converting dates


#convert & combining date and time columns
datetime <- paste(as.Date(SetData$Date), SetData$Time)
SetData$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(SetData$Global_active_power)

plot(SetData$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
