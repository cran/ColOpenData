## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----IDEAM table, echo = FALSE------------------------------------------------
tags <- c(
  "TSSM_CON", "THSM_CON", "TMN_CON", "TMX_CON", "TSTG_CON", "HR_CAL",
  "HRHG_CON", "TV_CAL", "TPR_CAL", "PTPM_CON", "PTPG_CON", "EVTE_CON",
  "FA_CON", "NB_CON", "RCAM_CON", "BSHG_CON", "VVAG_CON", "DVAG_CON",
  "VVMXAG_CON", "DVMXAG_CON"
)
variable <- c(
  "Dry-bulb Temperature", "Wet-bulb Temperature",
  "Minimum Temperature", "Maximum Temperature",
  "Dry-bulb Temperature (Termograph)", "Relative Humidity",
  "Relative Humidity (Hydrograph)", "Vapour Pressure", "Dew Point",
  "Precipitation (Daily)", "Precipitation (Hourly)", "Evaporation",
  "Atmospheric Phenomenon", "Cloudiness", "Wind Trajectory",
  "Sunshine Duration", "Wind Speed", "Wind Direction",
  "Maximum Wind Speed", "Maximum Wind Direction"
)

IDEAM_tags <- data.frame(
  Tags = tags, Variable = variable,
  stringsAsFactors = FALSE
)
knitr::kable(IDEAM_tags)

## ----library imports, results = "hide", warning = FALSE, message = FALSE------
library(ColOpenData)
library(dplyr)
library(sf)
library(leaflet)
library(ggplot2)

## ----polygon creation---------------------------------------------------------
lat <- c(4.263744, 4.263744, 4.078156, 4.078156, 4.263744)
lon <- c(-75.042067, -74.777022, -74.777022, -75.042067, -75.042067)
polygon <- st_polygon(x = list(cbind(lon, lat))) %>% st_sfc()
roi <- st_as_sf(polygon)

## ----polygon plot-------------------------------------------------------------
leaflet(roi) %>%
  addProviderTiles("OpenStreetMap") %>%
  addPolygons(
    stroke = TRUE,
    weight = 2,
    color = "#2e6930",
    fillColor = "#2e6930",
    opacity = 0.6
  )

## ----stations in roi----------------------------------------------------------
stations <- stations_in_roi(geometry = roi)

head(stations)

## ----stations filtered--------------------------------------------------------
cw_stations <- stations %>%
  filter(
    as.Date(fecha_suspension) > as.Date("2013-01-01") | estado == "Activa",
    categoria %in% c("Climática Principal", "Climática Ordinaria")
  )

head(cw_stations)

## ----download climate stations------------------------------------------------
tssm_stations <- download_climate_stations(
  stations = cw_stations,
  start_date = "2013-01-01",
  end_date = "2016-12-31",
  tag = "TSSM_CON"
)

head(tssm_stations)

## ----plot temperatures stations-----------------------------------------------
ggplot(data = tssm_stations) +
  geom_line(aes(x = date, y = value, group = station), color = "#106ba0") +
  ggtitle("Dry-bulb Temperature in Espinal by station") +
  xlab("Date") +
  ylab("Temperature [°C]") +
  facet_grid(rows = vars(station)) +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "white", colour = "white"),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.title = element_text(hjust = 0.5)
  )

## ----plot monthly-------------------------------------------------------------
tssm_month <- tssm_stations %>% aggregate_climate(frequency = "month")

ggplot(data = tssm_month) +
  geom_line(aes(x = date, y = value, group = station), color = "#106ba0") +
  ggtitle("Dry-bulb Temperature in Espinal by station") +
  xlab("Date") +
  ylab("Dry-bulb temperature [C]") +
  facet_grid(rows = vars(station)) +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "white", colour = "white"),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.title = element_text(hjust = 0.5)
  )

## ----download climate data, eval = FALSE--------------------------------------
#  tssm_roi <- download_climate_geom(
#    geometry = roi,
#    start_date = "2013-01-01",
#    end_date = "2016-12-31",
#    tag = "TSSM_CON"
#  ) %>% aggregate_climate(frequency = "month")

## ----municipality code--------------------------------------------------------
espinal_code <- name_to_code_mun("Tolima", "Espinal")
espinal_code

## ----download climate mpio, eval = FALSE--------------------------------------
#  tssm_mpio <- download_climate(
#    code = espinal_code,
#    start_date = "2013-01-01",
#    end_date = "2016-12-31",
#    tag = "TMX_CON"
#  ) %>% aggregate_climate(frequency = "month")

