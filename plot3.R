## Roughly calculating memory usage to load 2075259 rows and 9 cols in MB
## (2075259 * 9 * 8)*1e-6 = 150MB

## setwd() to file location
## loading data from txt file and subsetting required rows at same time
df<- subset(read.table("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors = FALSE),Date == "1/2/2007" | Date == "2/2/2007")


##Check the structure of df
str(df)

## Create Date Time column
df <- df %>%
  mutate(DateTime = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

## create weekday column

## convert rest columns to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

##Saving plot as png
png(filename="C:/Users/pjodh/Desktop/DATA SCIENCE/Coursera/Exploratory_data_analysis/exdata_data_household_power_consumption/plot3.png", width = 480, height = 480)

plot3 <- plot(df$DateTime,df$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lwd=1,col=c("black","red","blue"))

dev.off()