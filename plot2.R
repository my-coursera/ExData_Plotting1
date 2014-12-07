## COURSERA - DATA SCIENCE SPECIALIZATION
## EXPLORATORY DATA ANALYSIS - DEC 2014
## PROJECT 1 - PLOT 2

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

## Using the following *nix command it was made sure that there were
## no fields with '?'(NA) on these two days
## cat household_power_consumption.txt | grep "^[1|2]/2/2007" | grep "?"

## New column for date and time
data$dt <- as.POSIXlt(paste(data$Date, data$Time), format = "%d/%m/%Y %R")

png("plot2.png")
with(data, plot(dt, Global_active_power, type = "l"
                , xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
