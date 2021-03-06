####Download the file and extract 2007-02-01 and 2007-02-02 data ()
#data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,comment.char="",rowIndex=4000:4200)
data<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
head(data)

#####
####Make 3rd plot
with(data,plot(data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n"))
with(data,lines(data$Sub_metering_2,col="red"))
with(data,lines(data$Sub_metering_3,col="blue"))
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()