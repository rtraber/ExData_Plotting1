# Exploratory Data Analysis
# Rolf Traber 2015-3-8 Project1
# Plot 1 / Function assumes that a clean data.frame named "power.consf" already exists. (See importdata.R for details)
plot1<-function(data,file="", width = 480, height = 480) {
        fileType=tail(unlist(strsplit(file,"[.]")),n=1)
        if (length(fileType) > 0) {
                switch(fileType,
                       png=png(filename=file,width=width,height=height),
                       bmp=bmp(filename=file,width=width,height=height),
                       jpg=jpeg(filename=file,width=width,height=height),
                       tif=tiff(filename=file,width=width,height=height)
                )
        }
        hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
        if (length(fileType) > 0) dev.off()         
}

plot1(power.consf,"plot1.png")
