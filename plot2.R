##Reading Data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = '?')
dataset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dataset$Time <- paste(dataset$Date, dataset$Time, sep = " ")
dataset <- dataset[,-1]
dataset$Time <- strptime(dataset$Time, format = '%d/%m/%Y %H:%M:%S')

## Opening a png device
png('ExData_plotting1/plot2.png', height = 480, width = 480, units = 'px')

## Drawing a plot
with(dataset, plot(x = Time, y = Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l'))

##Closing a png device
dev.off()