data <- read.csv("household_power_consumption.txt.gz",
                 sep=";",na.strings = "?",nrows=-1,
                 colClasses=c("character","character","numeric",
                              "numeric","numeric","numeric",
                              "numeric","numeric","numeric"))


first <- which(data$Date=="1/2/2007")[1]
last <-  rev(which(data$Date=="2/2/2007"))[1]

data <- data[first:last,]
  
png(file="plot4.png")

par(mfcol=c(2,2))

## Plot 1

plot(1:nrow(data),data[,3], col="black", ylab="Global Active Power (kilowatts)",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))

## Plot 2

plot(1:nrow(data),data[,7], type="n",xaxt="n", 
      xlab="",ylab="Energy sub metering")
legend("topright",names(data)[7:9],
       col=c("black","red","blue"),lty=1,bty="n",cex=0.9)

axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))

lines(1:nrow(data), data$Sub_metering_1,   col="black")
lines(1:nrow(data), data$Sub_metering_2,   col="red")
lines(1:nrow(data), data$Sub_metering_3,   col="blue")

## Plot 3

plot(1:nrow(data),data$Voltage, col="black", ylab="Global Active Power (kilowatts)",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
mtext("datetime",side=1,line=3)
## Plot 4

plot(1:nrow(data),data$Global_reactive_power, col="black", ylab="Global Active Power (kilowatts)",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
mtext("datetime",side=1,line=3)


dev.off()
