data <- read.csv("household_power_consumption.txt.gz",
                 sep=";",na.strings = "?",nrows=-1,
                 colClasses=c("character","character","numeric",
                              "numeric","numeric","numeric",
                              "numeric","numeric","numeric"))


first <- which(data$Date=="1/2/2007")[1]
last <-  rev(which(data$Date=="2/2/2007"))[1]

data <- data[first:last,]
  
png(file="plot1.png")
hist(data[,3], col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power",ylim=c(0,1200))
dev.off()
