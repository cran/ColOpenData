## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(tolower(Sys.getenv("NOT_CRAN")), "true")
)

## ----available datasets, echo = FALSE-----------------------------------------
#  code <- c(
#    "DPTO", "MPIO",
#    "MPIOCL", "MZN",
#    "SECR", "SECU",
#    "SETR", "SETU",
#    "ZU"
#  )
#  level <- c(
#    "Department", "Municipality",
#    "Municipality including Class", "Block", "Rural Sector", "Urban Sector",
#    "Rural Section", "Urban Section", "Urban Zone"
#  )
#  dictionary_key <- c(
#    "DANE_MGN_2018_DPTO", "DANE_MGN_2018_MPIO",
#    "DANE_MGN_2018_MPIOCL", "DANE_MGN_2018_MZN",
#    "DANE_MGN_2018_SECR", "DANE_MGN_2018_SECU",
#    "DANE_MGN_2018_SETR", "DANE_MGN_2018_SETU",
#    "DANE_MGN_2018_ZU"
#  )
#  
#  mgncnpv <- data.frame(
#    Code = code, Level = level, Name = dictionary_key,
#    stringsAsFactors = FALSE
#  )
#  knitr::kable(mgncnpv)

## ----library imports, results = "hide", warning = FALSE, message = FALSE------
#  library(ColOpenData)
#  library(dplyr)
#  library(sf)
#  library(ggplot2)
#  library(leaflet)

## ----download data------------------------------------------------------------
#  dpto <- download_geospatial(
#    spatial_level = "dpto",
#    simplified = TRUE,
#    include_geom = TRUE,
#    include_cnpv = TRUE
#  )
#  
#  head(dpto)

## ----dictionary for urban sections--------------------------------------------
#  dict <- geospatial_dictionary(spatial_level = "dpto", language = "EN")
#  
#  head(dict)

## -----------------------------------------------------------------------------
#  internet_cov <- dpto %>% mutate(internet = round(viv_internet / viviendas, 2))

## ----ggplot2------------------------------------------------------------------
#  ggplot(data = internet_cov) +
#    geom_sf(mapping = aes(fill = internet), color = NA) +
#    theme_minimal() +
#    theme(
#      plot.background = element_rect(fill = "white", colour = "white"),
#      panel.background = element_rect(fill = "white", colour = "white"),
#      panel.grid = element_blank(),
#      axis.text = element_blank(),
#      axis.ticks = element_blank()
#    ) +
#    scale_fill_gradient("Percentage", low = "#10bed2", high = "#deff00") +
#    ggtitle(
#      label = "Internet coverage",
#      subtitle = "Colombia"
#    )

## ----define color palette-----------------------------------------------------
#  colfunc <- colorRampPalette(c("#10bed2", "#deff00"))
#  pal <- colorNumeric(
#    palette = colfunc(100),
#    domain = internet_cov[["internet"]]
#  )

## ----leaflet------------------------------------------------------------------
#  leaflet(internet_cov) %>%
#    addProviderTiles(providers$CartoDB.Positron) %>%
#    addPolygons(
#      stroke = TRUE,
#      weight = 0,
#      color = NA,
#      fillColor = ~ pal(internet_cov[["internet"]]),
#      fillOpacity = 1,
#      popup = paste0(internet_cov[["internet"]])
#    ) %>%
#    addLegend(
#      position = "bottomright",
#      pal = pal,
#      values = ~ internet_cov[["internet"]],
#      opacity = 1,
#      title = "Internet Coverage"
#    )

