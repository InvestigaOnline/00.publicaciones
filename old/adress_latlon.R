
library(leaflet)
library(leaflet.extras)
library(leaflet.extras2)
library(ggmap)
library(maptools)
library(expss)
library(dplyr)

df <- read_spss('~/R/r-data/00.tesis/tesis.bbdd.sav')
data1 <- read.csv(file='~/R/r-data/00.tesis/data1.csv')
df <- cbind(df, data1)
dfgeo <- select(df, 1,126,127,128,130,131)
dfgeo$adress <- paste(dfgeo$DIRECCION,',',dfgeo$CP,',',dfgeo$MUNICIPIO,',',dfgeo$PROVINCIA, sep='')

#las tres siguientes no se ejecutan porque se hacen para obtener lat y lon y ahora ya las tenemos
#register_google(key='AIzaSyBZ2y7PVktf_y_R6NCt5JD7I7sD-mTqqBk')
#dfgeo <- as.data.frame(geocode(dfgeo$adress, output='latlon'))
#write.csv(data1,file='~/R/r-data/00.tesis/data1.csv', row.names = FALSE, fileEncoding = 'UTF-8')

data <- cbind(df, dfgeo)


leaflet(data) %>%
     addTiles() %>%  # Add default OpenStreetMap map tiles
     addMarkers(lng=~lon, lat=~lat, , popup = ~EMPRESA) #%>%
     addCircles(lng = ~lon, lat = ~lat, popup = ~EMPRESA)
