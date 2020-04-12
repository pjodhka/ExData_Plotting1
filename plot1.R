## Roughly calculating memory usage to load 2075259 rows and 9 cols in MB
## (2075259 * 9 * 8)*1e-6 = 150MB

## setwd() to file location
## loading data from txt file and subsetting required date rows at same time
df<- subset(read.table("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors = FALSE),Date == "1/2/2007" | Date == "2/2/2007")


##Check the structure of df
str(df)

## Create Date Time column
df <- df %>%
  mutate(DateTime = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))


## convert rest columns to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)


##saving plot as png file
png(filename="C:/Users/pjodh/Desktop/DATA SCIENCE/Coursera/Exploratory_data_analysis/exdata_data_household_power_consumption/plot1.png", width = 480, height = 480)

plot1 <- hist(df$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()
