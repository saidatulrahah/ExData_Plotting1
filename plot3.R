## Getting full dataset
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",  quote='\"')


## Subsetting the data
SetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#View(SetData)
write.table(SetData, "SubSet.txt")
SetData$Date <- as.Date(SetData$Date, format="%d/%m/%Y") #converting dates


#convert & combining date and time columns
datetime <- paste(as.Date(SetData$Date), SetData$Time)
SetData$Datetime <- as.POSIXct(datetime)

## Plot 3
with(SetData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
