data <- read.csv("household_power_consumption.txt.gz",
                 sep=";",na.strings = "?",nrows=-1,
                 colClasses=c("character","character","numeric",
                              "numeric","numeric","numeric",
                              "numeric","numeric","numeric"))


first <- which(data$Date=="1/2/2007")[1]
last <-  rev(which(data$Date=="2/2/2007"))[1]

data <- data[first:last,]

tick1 <- -1
## Viernes == Friday in Spanish
tick2 <- which(weekdays(as.Date(data$Date,"%d/%m/20%y"))=="viernes")[1]
tick3 <- nrow(data)+1
ticks <- c(tick1, tick2, tick3)
  
png(file="plot4.png")

par(mfcol=c(2,2))

with(data,{
## Plot 1

plot(1:nrow(data),Global_active_power, col="black", ylab="Global Active Power",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=ticks,labels=c("Thu","Fri","Sat"))

## Plot 2

plot(1:nrow(data),Sub_metering_1, type="n",xaxt="n", 
      xlab="",ylab="Energy sub metering")
legend("topright",names(data)[7:9],
       col=c("black","red","blue"),lty=1,bty="n",cex=0.95)

axis(1, at=ticks,labels=c("Thu","Fri","Sat"))

lines(1:nrow(data), Sub_metering_1,   col="black")
lines(1:nrow(data), Sub_metering_2,   col="red")
lines(1:nrow(data), Sub_metering_3,   col="blue")

## Plot 3
plot(1:nrow(data),Voltage, col="black",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=ticks,labels=c("Thu","Fri","Sat"))
mtext("datetime",side=1,line=3)

## Plot 4

plot(1:nrow(data),Global_reactive_power, col="black",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=ticks,labels=c("Thu","Fri","Sat"))
mtext("datetime",side=1,line=3)

})
dev.off()
