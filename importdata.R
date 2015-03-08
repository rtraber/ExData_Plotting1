# Exploratory Data Analysis
# Rolf Traber 2015-3-8 Project1
# Import and cleanup data according to project requirements

require(dplyr)
require(plyr)

lnk="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file="power_consumption.zip"
download.file(lnk,destfile=file,method="curl")
unzip(file)

power.cons<-read.table("household_power_consumption.txt",stringsAsFactors=F,header=T,sep=";")

power.cons[,'Date']=as.POSIXct(strptime(paste(power.cons[,'Date'],power.cons[,'Time']),"%d/%m/%Y %H:%M:%S" ))
date1=as.POSIXct(strptime("2007-02-01","%Y-%m-%d"))
date2=as.POSIXct(strptime("2007-02-03","%Y-%m-%d"))

#power.cons[,'Date']=as.Date(strptime(paste(power.cons[,'Date'],power.cons[,'Time']),"%d/%m/%Y %H:%M:%S" ))
#date1=as.Date(strptime("2007-02-01","%Y-%m-%d"))
#date2=as.Date(strptime("2007-02-03","%Y-%m-%d"))

power.consf<-filter(power.cons,Date>=date1 & Date<=date2)

power.consf[,'Global_active_power']=as.numeric(power.consf[,'Global_active_power'])
power.consf[,'Global_reactive_power']=as.numeric(power.consf[,'Global_reactive_power'])
power.consf[,'Voltage']=as.numeric(power.consf[,'Voltage'])
power.consf[,'Global_intensity']=as.numeric(power.consf[,'Global_intensity'])
power.consf[,'Sub_metering_1']=as.numeric(power.consf[,'Sub_metering_1'])
power.consf[,'Sub_metering_2']=as.numeric(power.consf[,'Sub_metering_2'])
power.consf[,'Sub_metering_3']=as.numeric(power.consf[,'Sub_metering_3'])