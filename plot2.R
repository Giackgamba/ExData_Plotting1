## Download the zip file and store in a temporary file, 
## unzip it and read only the relvant data

temp <- tempfile()

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = temp)

data <- read.table(unz(temp, 'household_power_consumption.txt'), 
                   skip = 66637, nrow = 2880, sep =  ';')

unlink(temp)

names(data) <- c('Date', 'Time', 'Global_active_power','Global_reactive_power',
                 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2',
                 'Sub_metering_3')

data$datetime <- paste(data$Date, data$Time, sep = ' ')
data$datetime <- strptime(data$datetime, format = '%d/%m/%Y %H:%M:%S')

Sys.setlocale("LC_TIME", "English")

png(filename = 'plot2.png', width = 480, height = 480)

plot(data$datetime, data$Global_active_power, type = 'l', 
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')
dev.off()
