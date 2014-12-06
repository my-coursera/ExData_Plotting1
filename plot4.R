## COURSERA - DATA SCIENCE SPECIALIZATION
## EXPLORATORY DATA ANALYSIS - DEC 2014
## PROJECT 1 - PLOT 4

FILE_URL <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
FILENAME <- "household_power_consumption.zip"
DATA_SET <- "household_power_consumption.txt"

## If not already present and named as $FILENAME in the working directory,
## zip file will be downloaded and extracted there

if(!file.exists(FILENAME)) {
    download.file(FILE_URL, destfile = FILENAME, method = "curl")    
}

if(!file.exists(DATA_SET)) {
    unzip(FILENAME)       
}

## Reading column names separately, since they'll be skipped while reading data
table_headers <- names(read.table(DATA_SET, sep = ";", header = TRUE, nrows = 1))

## Reading actual data between 2007/2/1 and 2007/2/2
data <- read.table(DATA_SET, sep = ";", skip = 66637, nrows = 2880)
names(data) <- table_headers

## For the purpose of doing this project, it was made sure via other means
## that there were no fields with '?'(NA) on these two days

## New column for date and time
data$dt <- as.POSIXlt(paste(data$Date, data$Time), format = "%d/%m/%Y %R")

png("plot4.png")

par(mfrow = c(2, 2))

############### PLOT (1, 1) ###############

with(data, plot(dt, Global_active_power, type = "l"
                , xlab = "", ylab = "Global Active Power"))

############### PLOT (1, 2) ###############

with(data, plot(dt, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

############### PLOT (2, 1) ###############

with(data, plot(dt, Sub_metering_1, type = "l"
                , xlab = "", ylab = "Energy sub metering"))
with(data, points(dt, Sub_metering_2, col = "red", type = "l"))
with(data, points(dt, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = "solid", bty = "n", col = c("black", "red", "blue")
       , cex = 0.9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

############### PLOT (2, 2) ###############

with(data, plot(dt, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()