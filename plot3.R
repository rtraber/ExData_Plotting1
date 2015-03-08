# Exploratory Data Analysis
# Rolf Traber 2015-3-8 Project1
# Plot 3 / Function assumes that a clean data.frame named "power.consf" already exists. (See importdata.R for details)
plot3<-function(data,file="", width = 480, height = 480) {
        fileType=tail(unlist(strsplit(file,"[.]")),n=1)
        if (length(fileType) > 0) {
                switch(fileType,
                       png=png(filename=file,width=width,height=height),
                       bmp=bmp(filename=file,width=width,height=height),
                       jpg=jpeg(filename=file,width=width,height=height),
                       tif=tiff(filename=file,width=width,height=height)
                )
        }
        with(data,plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
        with(data,lines(Date,Sub_metering_2,col="red"))
        with(data,lines(Date,Sub_metering_3,col="blue"))
        legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        if (length(fileType) > 0) dev.off()         
}

plot3(power.consf,file="plot3.png")