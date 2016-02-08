plot3 <- function() {
##Read the file - skip records until Feb 1st 2007 and read until Feb 2nd 2007
datatable <- read.table("household_power_consumption.txt", header=FALSE,sep=";",skip=66638,nrows=2880)

##create the date and time columns as a datetime object
datetime <- as.POSIXct(strptime(paste(datatable[,1],datatable[,2]), "%d/%m/%Y %H:%M:%S"))

## create a data frame with the datetime and the rest of the columns
dm <- data.frame(datetime=datetime, GAP=datatable[,3], GRP=datatable[,4], Voltage=datatable[,5], sm1=datatable[,7], sm2=datatable[,8], sm3=datatable[,9])

## Define the png output file
png("plot3.png", width=480, height=480)

## plot the graph 
 plot(sm1 ~ datetime, dm, type="n", ylab="Energy sub metering", xlab="")
 lines(sm1 ~ datetime, dm)
 lines(sm2 ~ datetime, dm, col="red")
 lines(sm3 ~ datetime, dm, col="blue")
 legend("topright", lty=c("solid", "solid", "solid"), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.75)
## define the axis
axis.POSIXct(1,at=seq(from=round(dm$datetime[1],"day"),to=tail(dm$datetime,1),by="1 day"), format="%a")

dev.off()
}