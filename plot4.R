#Coded on 32bit WindowsXP PC

#Read in dataset text file
dataset <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Coded on 32bit WindowsXP PC
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
png(file="plot4.png", height=480, width=480)

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_rective_power",xlab="datetime")
})

dev.off()