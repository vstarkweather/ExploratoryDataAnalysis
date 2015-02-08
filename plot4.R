# the sqldf package is used to load just a portion of the big data set, using the select command.
library(sqldf)
electric <- read.csv2.sql("./household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
# the Date and Time columns are of class "character"; the following command combines the data using "paste" and then converts the results to POSIXlt format
electric$Date <- strptime(paste(electric$Date,electric$Time), "%d/%m/%Y %H:%M:%S")
# a PNG device is opened, and the plot is created
png(file = "plot4.png")
par(mfcol = c(2,2))
with(electric, {
        plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(Date, Sub_metering_2, col = "red")
        lines(Date, Sub_metering_3, col = "blue")
        legend("topright", lty = 1, bty = "o", box.lty = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off() # the PNG device is closed
# for convenience, the plot is sent to the screen
par(mfcol = c(2,2))
with(electric, {
        plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
                lines(Date, Sub_metering_2, col = "red")
                lines(Date, Sub_metering_3, col = "blue")
                legend("topright", lty = 1, bty = "o", box.lty = 1, box.col = "transparent", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
