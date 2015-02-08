# the sqldf package is used to load just a portion of the big data set, using the select command.
library(sqldf)
electric <- read.csv2.sql("./household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
# the Date and Time columns are of class "character"; the following command combines the data using "paste" and then converts the results to POSIXlt format
electric$Date <- strptime(paste(electric$Date,electric$Time), "%d/%m/%Y %H:%M:%S")
# a PNG device is opened, and the plot is created
png(file = "plot1.png")
with(electric, hist(Global_active_power, col = 18, main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off() # the PNG device is closed
# for convenience, the plot is sent to the screen
with(electric, hist(Global_active_power, col = 18, main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))