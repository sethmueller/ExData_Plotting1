# load libraries
library(data.table)
library(lubridate)

# load in data set, assume txt file in current working directory
power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# convert and filter dates
power$Date = dmy(power$Date)
power <- subset(power, Date >= "2007-02-01" & Date < "2007-02-03")

# draw histogram of global active power and store it in plot1.png
png(file = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
