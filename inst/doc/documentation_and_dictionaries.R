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

## ----setup--------------------------------------------------------------------
library(ColOpenData)

## ----list datasets------------------------------------------------------------
datasets <- list_datasets(language = "EN")

head(datasets)

## ----list demographic datasets------------------------------------------------
demographic_datasets <- list_datasets(module = "demographic", language = "EN")

head(demographic_datasets)

## ----list datasets with information by age------------------------------------
age_datasets <- look_up(keywords = "age")

head(age_datasets)

## ----list datasets with information by area and sex in demographic module-----
area_sex_datasets <- look_up(
  keywords = c("area", "sex"),
  module = "demographic",
  logic = "and",
  language = "EN"
)

head(area_sex_datasets)

## ----dictionary for MGNCNPV at municipalities---------------------------------
dict_mpio <- geospatial_dictionary(
  spatial_level = "municipality",
  language = "EN"
)

head(dict_mpio)

## ----dicionary for climate data-----------------------------------------------
dict_climate <- get_climate_tags(language = "EN")

head(dict_climate)

## ----divipola-table-----------------------------------------------------------
divipola <- divipola_table()
head(divipola)

## ----cordoba------------------------------------------------------------------
name_to_code_dep(department_name = "Guajira")

## ----divipola tunja-----------------------------------------------------------
name_to_code_mun(
  department_name = "Boyacá",
  municipality_name = "Tunja"
)

## ----tunja name---------------------------------------------------------------
code_to_name_mun(municipality_code = "15001")

