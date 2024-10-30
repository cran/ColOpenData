## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(tolower(Sys.getenv("NOT_CRAN")), "true")
)

## ----available datasets, echo = FALSE-----------------------------------------
#  level <- c(
#    "National", "National with sex",
#    "Department", "Department with Sex",
#    "Municipality", "Municipality with Sex",
#    "Municipaity with Sex and Ethnic Groups"
#  )
#  years <- c(
#    "1950 - 2070", "1985 - 2050",
#    "1985 - 2050", "1985 - 2050", "1985 - 2035", "1985 - 2035",
#    "2018 - 2035"
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
#    Level = level, Years = years,
#    stringsAsFactors = FALSE
#  )
#  knitr::kable(mgncnpv)

## -----------------------------------------------------------------------------
#  library(ColOpenData)
#  library(dplyr)
#  library(ggplot2)

## ----download data------------------------------------------------------------
#  asen <- download_pop_projections(
#    spatial_level = "national",
#    start_year = 2034,
#    end_year = 2034,
#    include_sex = TRUE,
#    include_ethnic = FALSE
#  )

## ----filtered projections-----------------------------------------------------
#  female_2034 <- asen %>%
#    filter(
#      area == "total",
#      sexo == "mujer",
#      edad != "100_y_mas"
#    ) %>%
#    mutate(edad = as.numeric(edad))

## ----age groups---------------------------------------------------------------
#  age_groups <- cut(female_2034[["edad"]],
#    breaks = c(-1, 2, 12, 19, 29, 39, 49, 59, 69, 79, 89, 99),
#    labels = c(
#      "0-2", "3-12", "13-19", "20-29", "30-39", "40-49",
#      "50-59", "60-69", "70-79", "80-89", "90-99"
#    )
#  )
#  female_groups <- female_2034 %>%
#    mutate(age_group = age_groups) %>%
#    group_by(age_group) %>%
#    summarise(total_sum = sum(total))

## ----plot population----------------------------------------------------------
#  ggplot(female_groups, aes(
#    x = age_group,
#    y = total_sum
#  )) +
#    geom_bar(stat = "identity", fill = "#f04a4c", color = "black", width = 0.6) +
#    labs(
#      title = "Female population counts in Colombia by age group for 2034",
#      x = "Age group",
#      y = "Female population"
#    ) +
#    theme_minimal() +
#    theme(
#      plot.background = element_rect(fill = "white", colour = "white"),
#      panel.background = element_rect(fill = "white", colour = "white"),
#      axis.text.x = element_text(angle = 45, hjust = 1),
#      plot.title = element_text(hjust = 0.5)
#    )

