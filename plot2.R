
setwd("~/Training/04 Exploratory Data Analysis")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile="./data/power.zip"

if(!file.exists("./data")){dir.create("./data")}
if(!file.exists(destfile)) {
        print("Downloading File... ")
        download.file(url,destfile=destfile, mode="wb")
        setwd("./data")
        unzip("power.zip")
        setwd("..")
}

print("Loading Data...")
fileName = "./data/household_power_consumption.txt"
power <- read.table(fileName, sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

############ Plot 2 ############

print("Subsetting Data...")
power <- power[(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]


print("Creating plot...")
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("./data/plot2.png", width = 480, height = 480)
with(power, plot(DateTime, Global_active_power, type = "l", 
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
