
source("format_data.R")

# create graphing png file
 png(filename="plot4.png", height = 480 , width = 480)

par(mfrow = c(2,2) )

v1 <- c(0,1450,2900)
 v2 <- c("Thu","Fri","Sat")

with(hpc_sub, plot( as.numeric(Global_active_power)/500,ylab="Global Active Power", type="l" , xaxt="n", xlab=""))

axis(side=1,at=v1,labels=v2,tck=-.03)

x <- as.numeric(hpc_sub$Voltage)*.14265
v1 <- c(150,200,250,300)
v2 <- c("234","238","242","246")
with(hpc_sub, plot(x, type="l", ylim=c(110,310),xaxt="n",yaxt="n", xlab="datetime", ylab="Voltage"))

axis(side=2, at= v1 ,labels= v2, tck=-.03)
v3 <- c(0,1250,2900)
v4 <- c("Thu","Fri","Sat")
axis(side=1, at= v3 ,labels= v4, tck=-.03)

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

v3 <- c(0,1250,2900)
with(hpc_sub, plot(as.numeric(Global_reactive_power)/450,xlab="datetime",ylab="Global_reative_power",xaxt="n",ylim=c(0,.5), type="l"))
axis(side=1, at= v3 ,labels= v4, tck=-.03)

dev.off()
