#note: the data frame we want to access must be present in the working directory.
#reading file
data<- "household_power_consumption.txt"
colNames = c("date", "time", "globalActivePower", "globalReactivePower", 
             "voltage", "globalIntensity", "subMetering1", "subMetering2",
             "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

#read file
data <- read.table(data, header=TRUE, sep=";", col.names=colNames, 
                   colClasses=colClasses, na.strings="?")

#let us convert to Date type, then do filter
data$date = as.Date(data$date, format="%d/%m/%Y")
data = data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

#plotting and saving the graph on to the divice
png(filename="plot1.png", width=480, height=480, units="px")
hist(data$globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()