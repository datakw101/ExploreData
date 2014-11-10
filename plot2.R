#Coded on 32bit WindowsXP PC
#Read in dataset text file
dataset <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Convert data$Date text to date format
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

#Subset the dataset to get required dates store in data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#manage memory and remove the initially loaded dataset
rm(dataset)

#create variable to store date and time
dt <- paste(as.Date(data$Date), data$Time)

#append variable to data$Datetime 
data$Datetime <- as.POSIXct(dt)

#Setup png
png(file="plot2.png", height=480, width=480)

#Plot 2
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()

