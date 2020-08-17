library(data.table)

table <- data.table::fread("household_power_consumption.txt", na.strings = "?")

table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(table2$Date, table2$Time, sep=" ")
                     , "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(table2$Global_active_power)

SM1 <- as.numeric(table2$Sub_metering_1)

SM2 <- as.numeric(table2$Sub_metering_2)

SM3 <- as.numeric(table2$Sub_metering_3)

GRP <- as.numeric(table2$Global_reactive_power)

voltage <- as.numeric(table2$Voltage)



png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## plot1

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##plot3
plot(datetime, SM1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SM2, col = "red")
lines(datetime, SM3, col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1), bty = "0")

##plot4
plot(datetime,GRP, xlab="datetime", ylab="Global_reactive_power", type = "l")

dev.off()




