## read data
hpc <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
## change fromat time as Posix using strptime then converting to time only using strftime
hpc$Time <- strptime(hpc$Time,format = "%H:%M:%S")
hpc$Time <- strftime(hpc$Time, format = "%H:%M:%S")

## change format to date using As.Date
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

##subset the data with only dates 2007-02-01 & 2007-02-02
hpc_sub <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")



## create graphing png file
 png(filename="plot2.png", height = 480 , width = 480)
## create plot 2
v1 <- c(0,1450,2900)
 v2 <- c("Thu","Fri","Sat")

with(hpc_sub, plot( as.numeric(Global_active_power)/500,ylab="Global_active_power", type="l" , xaxt="n", xlab=""))

axis(side=1,at=v1,labels=v2,tck=-.03)

dev.off()
