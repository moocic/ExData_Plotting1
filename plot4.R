## 1 - Read file, subset data and convert data/time variables
## NOTE: File "household_power_consumption.txt" must be in the working directory.

db <- read.table("household_power_consumption.txt",
                 header=T,
                 sep=";",
                 na.strings="?")

db$Date <- strptime(db$Date,format="%d/%m/%Y")

db <- db[which((db$Date=="2007-02-01")|(db$Date=="2007-02-02")),]

db$Time <- strptime(db$Time,format="%H:%M:%S")

db$Date$sec <- db$Time$sec
db$Date$min <- db$Time$min
db$Date$hour <- db$Time$hour


## 2 - Call plot and annotate plot

par(mfcol = c(2, 2))

# Plot 1

plot(db$Date,db$Global_active_power,
     ylab="Global Active Power",
     xlab="",
     type="n",cex=0.7)

lines(db$Date,db$Global_active_power)

# Plot 2

plot(db$Date,db$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="n",cex=0.7)

lines(db$Date,db$Sub_metering_1,col="black")
lines(db$Date,db$Sub_metering_2,col="red")
lines(db$Date,db$Sub_metering_3,col="blue")

legend("topright",
       lty=1,
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n",cex=0.7)

# Plot 3

plot(db$Date,db$Voltage,
     ylab="Voltage",
     xlab="datetime",
     type="n",cex=0.7)

lines(db$Date,db$Voltage)

# Plot 4

plot(db$Date,db$Global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datetime",
     type="n",cex=0.7)

lines(db$Date,db$Global_reactive_power)


## 3 - Create .png file

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()