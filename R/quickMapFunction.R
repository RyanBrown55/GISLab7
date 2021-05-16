
#' Make a choropleth map with quantile bins!
#' This function reads a OGR object, a selected column from that data frame to be mapped and a label for areal units.
#' The data is then mapped via leaflet!
#' @param df rgdal, readOGR obejcet
#' @param column the data you would like to use for the choropleth map with quantile bins!
#' @param labelcolumn unique identifier for areal units
#' @return leaflet choropleth map with quantile bins
#' @export

quickMap <- function(df,column,labelcolumn){
  factpal <- leaflet::colorQuantile("BuPu", NULL)
  m <-   
    leaflet::leaflet(df) %>%
    leaflet::addTiles() :%>%
    leaflet::addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                fillColor = ~factpal(column),
                label = ~paste0(labelcolumn, ": ", formatC(column, big.mark = ","))) %>%
    leaflet::addLegend(pal = factpal, values = ~column, opacity = 1.0)
   
  
  return(m)}
