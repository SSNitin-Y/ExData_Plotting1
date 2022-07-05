#note: the data frame we want to access must be present in the working directory.
#reading file
data<- "household_power_consumption.txt"

df <- read.table(data, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date type, then filtering
df$date = as.Date(df$date, format="%d/%m/%Y")
df = df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

#plotting and saving graph
png(filename="plot2.png", width=480, height=480, units="px")
plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
dev.off()
