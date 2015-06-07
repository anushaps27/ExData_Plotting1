#Reading the data from file
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

#Changing classes of variables and subsetting data
data["Date_Time"] <- dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
req_data <- rbind(data[data$Date=="2007-02-01",], data[data$Date=="2007-02-02",])

#Plotting the required graph
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#Plotting graph 1
xrange=range(req_data$Date_Time)
yrange=range(req_data$Global_active_power)
plot(xrange, yrange, type="n", xlab="", ylab="Global Active Power" ) 
lines(req_data$Date_Time,req_data$Global_active_power)
#Plotting graph 2
xrange=range(req_data$Date_Time)
yrange=range(req_data$Voltage)
plot(xrange, yrange, type="n", xlab="datetime", ylab="Votage" ) 
lines(req_data$Date_Time,req_data$Voltage)
#Plotting graph 3
xrange=range(req_data$Date_Time)
yrange=range(c(req_data$Sub_metering_1,req_data$Sub_metering_2,req_data$Sub_metering_3))
plot(xrange, yrange, type="n", xlab="", ylab="Energy sub metering" ) 
lines(req_data$Date_Time,req_data$Sub_metering_1, col="black")
lines(req_data$Date_Time,req_data$Sub_metering_2, col="red")
lines(req_data$Date_Time,req_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))
#Plotting graph 4
xrange=range(req_data$Date_Time)
yrange=range(req_data$Global_reactive_power)
plot(xrange, yrange, type="n", xlab="datetime", ylab="Global_reactive_power") 
lines(req_data$Date_Time,req_data$Global_reactive_power)
dev.off()