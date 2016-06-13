
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

############ Plot 3 ############

print("Subsetting Data...")
power <- power[(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]


print("Creating plot...")
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("./data/plot3.png", width = 480, height = 480)
with(power, plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.off()
