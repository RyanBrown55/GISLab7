
#' Make a choropleth map with quantile bins!
#' This function reads a OGR object, a selected column from that data frame to be mapped and a label for areal units.
#' The data is then mapped via leaflet!
#' @param df rgdal, readOGR obejcet
#' @param column the data you would like to use for the choropleth map with quantile bins!
#' @param labelcolumn unique identifier for areal units
#' @return leaflet choropleth map with quantile bins
#' @export


pal < function (x)
{
  if (length(x) == 0 || all(is.na(x))) {
    return(pf(x))
  }
  if (is.null(rng))
    rng <- range(x, na.rm = TRUE)
  rescaled <- scales::rescale(x, from = rng)
  if (any(rescaled < 0 | rescaled > 1, na.rm = TRUE))
    warning("Some values were outside the color scale and will be treated as NA")
  if (reverse) {
    rescaled <- 1 - rescaled
  }
  pf(rescaled)
}

quickMap <- function(df,column,labelcolumn){colorQuantile("BuPu", NULL)
  leaflet::leaflet(df) %>%
    addTiles() %>%
    addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                fillColor = ~pal(column),
                label = ~paste0(labelcolumn, ": ", formatC(column, big.mark = ","))) %>%
    addLegend(pal = pal, values = ~column, opacity = 1.0)}
