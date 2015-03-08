# Exploratory Data Analysis
# Rolf Traber 2015-3-8 Project1
# Plot 4 / Function assumes that a clean data.frame named "power.consf" already exists. (See importdata.R for details)
plot4<-function(data,file="", width = 480, height = 480) {
        fileType=tail(unlist(strsplit(file,"[.]")),n=1)
        parsave=par()
        if (length(fileType) > 0) {
                switch(fileType,
                       png=png(filename=file,width=width,height=height),
                       bmp=bmp(filename=file,width=width,height=height),
                       jpg=jpeg(filename=file,width=width,height=height),
                       tif=tiff(filename=file,width=width,height=height)
                )
        }
        par(mfrow=c(2,2))
        with(power.consf,{
                plot(Date,Global_active_power,main="",ylab="Global Active Power",type="l")     
                plot(Date,Voltage,main="",xlab="datetime",type="l")   
                
                plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
                lines(Date,Sub_metering_2,col="red")
                lines(Date,Sub_metering_3,col="blue")
                legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                
                plot(Date,Global_reactive_power,main="",xlab="datetime",type="l") 
        })
        
        if (length(fileType) > 0) dev.off()    
        #par(parsave)
}

plot4(power.consf,file="plot4.png")