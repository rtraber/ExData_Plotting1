# Exploratory Data Analysis
# Rolf Traber 2015-3-8 Project1
# Plot 2 / Function assumes that a clean data.frame named "power.consf" already exists. (See importdata.R for details)
plot2<-function(data,file="", width = 480, height = 480) {
        fileType=tail(unlist(strsplit(file,"[.]")),n=1)
        if (length(fileType) > 0) {
                switch(fileType,
                       png=png(filename=file,width=width,height=height),
                       bmp=bmp(filename=file,width=width,height=height),
                       jpg=jpeg(filename=file,width=width,height=height),
                       tif=tiff(filename=file,width=width,height=height)
                )
        }
        plot(data$Date,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
        if (length(fileType) > 0) dev.off()         
}

plot2(power.consf,file="plot2.png")
