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


png(filename = 'plot1.png', width = 480, height = 480)

hist(data$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()

