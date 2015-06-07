#Reading the data from file
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

#Changing classes of variables and subsetting data
data$Date <- as.character(data$Date)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
req_data <- rbind(data[data$Date=="1/2/2007",], data[data$Date=="2/2/2007",])

#Plotting the required histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(req_data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()