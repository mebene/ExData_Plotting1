
## read data
hpc <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
## change fromat time as Posix using strptime then converting to time only using strftime
hpc$Time <- strptime(hpc$Time,format = "%H:%M:%S")
hpc$Time <- strftime(hpc$Time, format = "%H:%M:%S")

## change format to date using As.Date
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

##subset the data with only dates 2007-02-01 & 2007-02-02
hpc_sub <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")


 
# create graphing png file
 png(filename="plot3.png", height = 480 , width = 480)


 x <- as.numeric(hpc_sub$Sub_metering_1)*1.30-2.6
 y <- (as.numeric(hpc_sub$Sub_metering_2)/6)-1/3
 z <- hpc_sub$Sub_metering_3
v1 <- c(0,10,20,30)
v2 <- c("0","10","20","30")

with(hpc_sub,plot(x,type="l" , xaxt="n",  yaxt = "n", ylim=c(0,45),ylab="Energy sub metering",xlab="" ))
axis(side = 2, at = v1 , labels=v2 , tck=-.035)
v3 <- c(0,1500,2900)
v4 <- c("Thu","Fri","Sat")
axis(side = 1, at = v3 , labels=v4 , tck=-.035)
with(hpc_sub,lines(y,type="l",col="red"))
with(hpc_sub,lines(z,type="l",col="blue"))

 legend("topright", lty=c(1,1,1),lwd=c(1,1,1), col= c("black","red","blue"), legend= c("Sub_metring_1","Sub_metring_2","Sub_metring_3"))

dev.off()