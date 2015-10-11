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

plot(db$Date,db$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="n")

lines(db$Date,db$Sub_metering_1,col="black")
lines(db$Date,db$Sub_metering_2,col="red")
lines(db$Date,db$Sub_metering_3,col="blue")

legend("topright",
       lty=1,
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## 3 - Create .png file

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()