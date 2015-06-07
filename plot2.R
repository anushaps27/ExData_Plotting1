library(lubridate)
#Reading the data from file
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

#Changing classes of variables and subsetting data
data["Date_Time"] <- dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
req_data <- rbind(data[data$Date=="2007-02-01",], data[data$Date=="2007-02-02",])

#Plotting the required graph
png(filename = "plot2.png", width = 480, height = 480)
xrange=range(req_data$Date_Time)
yrange=range(req_data$Global_active_power)
plot(xrange, yrange, type="n", xlab="", ylab="Global Active Power (kilowatts)" ) 
lines(req_data$Date_Time,req_data$Global_active_power)
dev.off()