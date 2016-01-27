library(raster)
library(ggmap)
library(ggplot2)

### Get India data
india <- getData("GADM", country = "India", level = 2)

map <- get_map("India", zoom = 4, maptype = "toner-lite")
regions <- data.frame(Region=c("Telangana", "Tamil Nadu", "Jammu and Kashmir"), Marketshare=c(.25, .30, .15))

states <- subset(india, NAME_1 %in% regions$Region)

ind1 <- states$ID_2[states$NAME_1 == "Telangana"]
ind2 <- states$ID_2[states$NAME_1 == "Tamil Nadu"]
ind3 <- states$ID_2[states$NAME_1 == "Jammu and Kashmir"]

states <- fortify(states)

foo <- data.frame(id = c(ind1, ind2, ind3),
                  marketshare = rep(regions$Marketshare, times = c(length(ind1), length(ind2), length(ind3))))

temp <- merge(states, foo, by = "id")

ggmap(map) +
  geom_map(data = temp, map = temp,
           aes(x = long, y = lat, map_id = id, group = group, fill = marketshare),
           colour = "grey50", size = 0.3) +
  theme(legend.position = "none")




india.map <- fortify(india)

ggplot() +
  geom_map(data = india.map, map = india.map,
           aes(x = long, y = lat, map_id = id, group = group),
           colour = "grey50", size = 0.3) +
  geom_map(data = temp, map = temp,
           aes(x = long, y = lat, map_id = id, group = group, fill = factor(marketshare)),
           colour = "grey50", size = 0.3) +
  theme(legend.position = "none")