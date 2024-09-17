## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libraries, message=FALSE, warning=FALSE, results="hide"------------------
library(ColOpenData)
library(dplyr)
library(ggplot2)

## ----documentation, echo =TRUE------------------------------------------------
datasets_dem <- list_datasets("demographic", "EN")

department_datasets <- datasets_dem[datasets_dem["level"] == "department", ]

head(department_datasets)

## ----data, echo =TRUE---------------------------------------------------------
chosen_dataset <- download_demographic("DANE_CNPVPD_2018_14BPD")

head(chosen_dataset)

## ----merge data, echo =TRUE---------------------------------------------------
merged_data <- merge_geo_demographic(
  demographic_dataset =
    "DANE_CNPVPD_2018_14BPD"
)

head(merged_data)

## ----mutate-------------------------------------------------------------------
merged_data <- merged_data %>%
  mutate(proportion_home_remedies = uso_remedios_caseros /
    total_personas_que_tuvieron_alguna_enfermedad)

## ----plot---------------------------------------------------------------------
ggplot(data = merged_data) +
  geom_sf(mapping = aes(fill = proportion_home_remedies), color = "white") +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "white", colour = "white"),
    panel.background = element_rect(fill = "white", colour = "white"),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) +
  scale_fill_gradient("Count", low = "#10bed2", high = "#deff00") +
  ggtitle(
    label = "Proportion of people who reported using home remedies to treat
    a health problem",
    subtitle = "Colombia"
  )

