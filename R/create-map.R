library("leaflet")
library("sf")

lancashire <- st_read("data/lancashire_climbs.shp")

leaflet() %>%
  addTiles() %>%
  addPolylines(data = lancashire, col = ~col, label = ~name)
