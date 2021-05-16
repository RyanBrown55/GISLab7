
# quickMap

<!-- badges: start -->
<!-- badges: end -->

The goal of quickMap is to enable users to create choropleth maps of spatial data in seconds! Create on OGR object and call the quickmap function with you data frame, column of interest and identifier column. After doing so a leaflet map using quantiles will be generated.

## Installation

You can install the released version of quickMap from [CRAN](https://CRAN.R-project.org) with:

``` r
devtools::install_github("RyanBrown55/GISLab7")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(quickMap)
df <- rgdal::readOGR("/pathToYourFile/nyc.geojson")
quickMap(df,df$rent2005,df$name)
```

