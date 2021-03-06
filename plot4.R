##Reading Data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = '?')
dataset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dataset$Time <- paste(dataset$Date, dataset$Time, sep = " ")
dataset <- dataset[,-1]
dataset$Time <- strptime(dataset$Time, format = '%d/%m/%Y %H:%M:%S')

## Opening a png device
png('ExData_plotting1/plot4.png', height = 480, width = 480, units = 'px')

## Drawing plots
par(mfrow = c(2,2))
with(dataset, plot(x = Time, y = Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l', col = 'black'))
with(dataset, plot(x = Time, y = Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l', col = 'black'))

with(dataset, plot(Time, Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l', col = 'black'))
with(dataset, points(Time, Sub_metering_2, type = 'l', col = 'red'))
with(dataset, points(Time, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)

with(dataset, plot(x = Time, y = Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l', col = 'black'))

##Closing a png device
dev.off()