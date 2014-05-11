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
  
png(file="plot3.png")
plot(1:nrow(data),data[,7], type="n",xaxt="n", 
      xlab="",ylab="Energy sub metering")
legend("topright",names(data)[7:9],
       col=c("black","red","blue"),lty=1, cex=0.9)

axis(1, at=ticks,labels=c("Thu","Fri","Sat"))

lines(1:nrow(data), data$Sub_metering_1,   col="black")
lines(1:nrow(data), data$Sub_metering_2,   col="red")
lines(1:nrow(data), data$Sub_metering_3,   col="blue")



dev.off()
