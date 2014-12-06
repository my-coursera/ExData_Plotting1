## COURSERA - DATA SCIENCE SPECIALIZATION
## EXPLORATORY DATA ANALYSIS - DEC 2014
## PROJECT 1 - PLOT 1

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

png("plot1.png")
with(data, hist(Global_active_power, col = "red"
                , main = "Global Active Power"
                , xlab = "Global Active Power (kilowatts)"))
dev.off()