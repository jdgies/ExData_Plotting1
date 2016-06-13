
setwd("~/Training/04 Exploratory Data Analysis")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile="./data/power.zip"

if(!file.exists("./data")){dir.create("./data")}
if(!file.exists(destfile)) {
        print("Downloading File... ")
        download.file(url,destfile=destfile, mode="wb")
        setwd("./data")
        unzip("power.zip")
}

print("Loading Data...")
fileName = "./data/household_power_consumption.txt"
power <- read.table(fileName, sep=";", header=TRUE, stringsAsFactors = TRUE, na.strings = "?")

print("Subsetting Data...")
power <- power[(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]

############ Plot 1 ############
print("Creating plot...")
png("./data/plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, col = "red", main = "Global Active Power", 
                 xlab = "Global Active Power (kilowatts)"))
#print("Saving plot as plot1.png...")
#dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
