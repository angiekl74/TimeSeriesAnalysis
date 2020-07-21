install.packages("WDI")
library("WDI")

# pull in the data
gdp<-WDI(country=c("US"), indicator = c("NY.GDP.PCAP.CD"), start=1960, end=2016)
print(gdp)

# Rename columns
names(gdp)<-c("iso2c","country","GDPperCap", "year")

# Sort in ascending order by year
gdp<-gdp[order(gdp$year),]

# Plot to see if there is a trend?
plot(GDPperCap~year, data=gdp)

# change to timeseries format
us<-ts(gdp$GDPperCap, start=min(gdp$year), end=max(gdp$year))

# print. No longer df format
print(us)

# install forecast package
install.packages("forecast")

# start the package
library("forecast")

# create the model using auto.arima()
usOPT<-auto.arima(us)

# see results
usOPT

# to predict method 1
predict(usOPT, n.ahead=5, se.fit=T)

# to predict method 2
GDPUSAForecast<-forecast(object = usOPT, h=5)

# to plot your prediction
plot(GDPUSAForecast)
