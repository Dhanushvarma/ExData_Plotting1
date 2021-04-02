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
#plot 2 is done bu using the genric plot fucntion .
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# finally , Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()