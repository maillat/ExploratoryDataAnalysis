# Download files
filePath <- "/Users/Data Science Coursera/ExData_Plotting1"
setwd(filePath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

# Unzip DataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reset working directory
filePath <- "/Users/Data Science Coursera/ExData_Plotting1/data"

#Read data into R
data_all <- read.table("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

head(data_all)
tail(data_all)

## Limit date to Feb1 and Feb2, 2007
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

head(data)
tail(data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
