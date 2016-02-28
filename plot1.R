##Reading Data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = '?')
dataset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dataset$Time <- paste(dataset$Date, dataset$Time, sep = " ")
dataset <- dataset[,-1]
dataset$Time <- strptime(dataset$Time, format = '%d/%m/%Y %H:%M:%S')

## Opening a png device
png('ExData_plotting1/plot1.png', height = 480, width = 480, units = 'px')

## Drawing a histogram
with(dataset, hist(x = Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequancy'))

##Closing a png device
dev.off()