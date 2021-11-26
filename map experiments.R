#https://jtr13.github.io/cc19/different-ways-of-plotting-u-s-map-in-r.html
library(usmap) #import the package
library(ggplot2) #use ggplot2 to add layer for visualization
library(tidyverse)
library(janitor)
plot_usmap(regions = "states") + 
  labs(title = "U.S. States",
       subtitle = "This is a blank map of the United States.") + 
  theme(panel.background=element_blank())
plot_usmap(regions = "counties") + 
  labs(title = "U.S. counties",
       subtitle = "This is a blank map of the United States.") + 
  theme(panel.background=element_blank())
plot_usmap(include = .south_region, exclude = c("VA"), labels = TRUE)
plot_usmap(include = c("CT", "ME", "MA", "NH", "VT")) +
  labs(title = "New England Region") +
  theme(panel.background = element_rect(color = "blue"))
#The complete list of regions to choose is the following: .east_north_central: East North Central census division .east_south_central: East South Central census division .midwest_region: Midwest census region .mid_atlantic: Mid-Atlantic census division .mountain: Mountain census division .new_england: New England census division .northeast_region: Northeast census region .north_central_region: North-Central census region .pacific: Pacific census division .south_atlantic: South Atlantic census division .south_region: South census region .west_north_central: West North Central census division .west_region: West census region .west_south_central: West South Central census division usmap really provides users with the choice to mix and match areas of interest, hence makes it very desirable to manipulate the map

plot_usmap(data = countypov, values = "pct_pov_2014", include = c("CT", "ME", "MA", "NH", "VT"), color = "blue") + 
  scale_fill_continuous(low = "white", high = "blue", name = "Poverty Percentage Estimates", label = scales::comma) + 
  labs(title = "New England Region", subtitle = "Poverty Percentage Estimates for New England Counties in 2014") +
  theme(legend.position = "right")

map_visualization =read_csv("data/ForStatAnalysis.csv") %>% clean_names()

plot_usmap(data = map_visualization, values = "total_migration", regions = "states") + 
  scale_fill_continuous(low = "red", high = "blue", name = "Migration", label = scales::comma) + 
  labs(title = "U.S. Migration", subtitle = "Migration from other states") +
  theme(legend.position = "right")

plot_usmap(data = map_visualization, values = "skew2020", regions = "states") + 
  scale_fill_continuous(low = "white", high = "blue", name = "Migration", label = scales::comma) + 
  labs(title = "2020 Election", subtitle = "2020 Election") +
  theme(legend.position = "right")

plot_usmap(data = map_visualization, values = "difference", regions = "states") + 
  scale_fill_manual(values = c("blue", "purple", "red")) + 
  labs(title = "2020 Election", subtitle = "2020 Election") +
  theme(legend.position = "right")

state <- map_data("state")
washington <- subset(state, region=="washington")
counties <- map_data("county")
washington_county <- subset(counties, region=="washington")

ca_map <- ggplot(data=washington, mapping=aes(x=long, y=lat, group=group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color="black", fill="white") + 
  geom_polygon(data=washington_county, fill=NA, color="black") + 
  geom_polygon(color="black", fill=NA) + 
  ggtitle('Washington Map with Counties') + 
  theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(),
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())
ca_map

library(tidyverse)
library(sf)
library(plotly)
library(leaflet)
#devtools::install_github("r-lib/devtools")
#library(devtools)
#devtools::install_github('walkerke/tigris')
install.packages("tmaptools")
install.packages("tmap")
library(tigris) #download shp file from U.S. census website
library(tmaptools)
library(tmap)
library(devtools)
install_version("tmap", version = "1.6.1", repos = "http://cran.us.r-project.org")

download.file("http://www2.census.gov/geo/tiger/GENZ2015/shp/cb_2015_us_state_20m.zip", destfile = "states.zip")
unzip("states.zip")
library(tmaptools)
us_geo<-tmap::tm_shape("cb_2015_us_state_20m.shp", as.sf = TRUE, stringsAsFactors = FALSE)
pop <- usmap::statepop
popmap <- tmap::append_data(us_geo, pop, key.shp = "NAME", key.data = "full")
