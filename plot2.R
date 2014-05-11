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
  
png(file="plot2.png")
plot(1:nrow(data),data[,3], col="black", ylab="Global Active Power (kilowatts)",
     main="",type="l",xlab="",xaxt="n")
axis(1, at=ticks,labels=c("Thu","Fri","Sat"))

dev.off()
