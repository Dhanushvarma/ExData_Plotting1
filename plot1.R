# Using the read.csv fucntion to import the full dataset
data_full <- read.csv("C:/Users/dhanush/Desktop/EDA/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
# Subsetting the data for the required date ranges
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)
# converting the date 
#using the paste fucntion which converts the arguememnts into strings and conconates them
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# Plot 1 is generated using the hist function which is used to generate the histogram of the given data values
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# Finally , Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

