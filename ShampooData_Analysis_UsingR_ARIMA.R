# Set directory and read in csv file
setwd("C:/Users/Lenovo/GitHub/TimeSeriesAnalysis")
shampoo <- read.csv("Resources/ShampooData.csv", stringsAsFactors = FALSE)

# Rename columns
names(shampoo)<-c("month","sales")

# Check datatypes
str(shampoo)

# ggplot library
library(ggplot2)

# General plot for trend?
ggplot(data=shampoo, aes(x=month, y=sales, group=1)) +
  +     geom_line()+
  +     geom_point()

# Change to ts() format
sales<-ts(shampoo$sales)

# Install forecast package
install.packages("forecast")

# start the package
library("forecast")

# Find optimal model
salesOPT<-auto.arima(sales)

# Forecast out 12 months
SalesForecast<-forecast(object = salesOPT, h=12)

# Plot 12 month forecast
plot(SalesForecast)