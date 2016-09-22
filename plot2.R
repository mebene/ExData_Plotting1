source("format_data.R")

## create graphing png file
 png(filename="plot2.png", height = 480 , width = 480)
## create plot 2
v1 <- c(0,1450,2900)
 v2 <- c("Thu","Fri","Sat")

with(hpc_sub, plot( as.numeric(Global_active_power)/500,ylab="Global_active_power", type="l" , xaxt="n", xlab=""))

axis(side=1,at=v1,labels=v2,tck=-.03)

dev.off()
