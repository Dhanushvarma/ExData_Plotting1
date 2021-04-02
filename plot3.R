# Using the read.csv fucntion to import the full dataset
totaldata <- read.csv("C:/Users/dhanush/Desktop/EDA/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
totaldata$Date <- as.Date(totaldata$Date, format="%d/%m/%Y")
# Subsetting the data for the required date ranges
data <- subset(totaldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(totaldata)
# converting the date 
#using the paste fucntion which converts the arguememnts into strings and conconates them
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# Using with() fucntion to generate plot 3 
#with(data, expr, …) -syntax , with is a generic function that evaluates expr in a local environment constructed from data. The environment has the caller's environment as its parent
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
# A legend is added to the plot using the legend()fucntion 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# finally , Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()