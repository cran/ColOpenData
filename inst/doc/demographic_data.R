## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(tolower(Sys.getenv("NOT_CRAN")), "true")
)

## ----libraries, message=FALSE, warning=FALSE, results="hide"------------------
#  library(ColOpenData)
#  library(dplyr)
#  library(ggplot2)

## ----documentation, echo =TRUE------------------------------------------------
#  datasets_dem <- list_datasets(module = "demographic", language = "EN")
#  
#  head(datasets_dem)

## ----data load, echo=TRUE-----------------------------------------------------
#  public_services_d <- download_demographic(dataset = "DANE_CNPVV_2018_8VD")
#  
#  head(public_services_d)

## ----wss----------------------------------------------------------------------
#  wss <- public_services_d %>%
#    filter(
#      area == "total_departamental",
#      servicio_publico == "acueducto"
#    ) %>%
#    select(departamento, disponible, total)

## ----counts wss---------------------------------------------------------------
#  total_counts <- wss %>%
#    group_by(departamento) %>%
#    summarise(total_all = sum(total)) %>%
#    ungroup()

## ----proportions wss----------------------------------------------------------
#  proportions_wss <- wss %>%
#    filter(disponible == "si") %>%
#    left_join(total_counts, by = "departamento") %>%
#    mutate(proportion_si = total / total_all)

## ----san andres---------------------------------------------------------------
#  proportions_wss[28, "departamento"] <- "SAPSC"

## ----plot wss-----------------------------------------------------------------
#  ggplot(proportions_wss, aes(
#    x = reorder(departamento, -proportion_si),
#    y = proportion_si
#  )) +
#    geom_bar(stat = "identity", fill = "#10bed2", color = "black", width = 0.6) +
#    labs(
#      title = "Proportion of dwellings with access to WSS by department",
#      x = "Department",
#      y = "Proportion"
#    ) +
#    theme_minimal() +
#    theme(
#      plot.background = element_rect(fill = "white", colour = "white"),
#      panel.background = element_rect(fill = "white", colour = "white"),
#      axis.text.x = element_text(angle = 45, hjust = 1),
#      plot.title = element_text(hjust = 0.5)
#    )

