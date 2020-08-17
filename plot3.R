library(data.table)

table <- data.table::fread("household_power_consumption.txt", na.strings = "?")

table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(table2$Date, table2$Time, sep=" ")
                     , "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(table2$Global_active_power)

SM1 <- as.numeric(table2$Sub_metering_1)

SM2 <- as.numeric(table2$Sub_metering_2)

SM3 <- as.numeric(table2$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, SM1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SM2, col = "red")
lines(datetime, SM3, col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
