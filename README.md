
<!-- README.md is generated from README.Rmd. Please edit that file. -->
<!-- The code to render this README is stored in .github/workflows/render-readme.yaml -->
<!-- Variables marked with double curly braces will be transformed beforehand: -->
<!-- `packagename` is extracted from the DESCRIPTION file -->
<!-- `gh_repo` is extracted via a special environment variable in GitHub Actions -->

# **ColOpenData** <img src="man/figures/logo.svg" align="right" width="200"/>

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit)
[![R-CMD-check](https://github.com/epiverse-trace/ColOpenData/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/epiverse-trace/ColOpenData/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/epiverse-trace/ColOpenData/branch/main/graph/badge.svg)](https://app.codecov.io/gh/epiverse-trace/ColOpenData?branch=main)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/ColOpenData)](https://CRAN.R-project.org/package=ColOpenData)
[![CRAN
downloads](https://cranlogs.r-pkg.org/badges/ColOpenData)](https://cran.r-project.org/package=ColOpenData)

<!-- badges: end -->

**ColOpenData** is a package designed to access curated and wrangled
Colombian demographic, geospatial, climate and population projections
data, retrieved from various open Colombian data sources. The package
addresses the challenge of scattered Colombian data across multiple web
sources by providing functions that enable users to select and load
desired datasets without the need for extensive data acquisition
processes. Additionally, the tidy data structure offered for demographic
and climate data facilitates analysis and visualization.

ColOpenData is developed at [Universidad de Los
Andes](https://www.uniandes.edu.co/) as part of the [Epiverse-TRACE
program](https://data.org/initiatives/epiverse/).

## Installation

You can install the CRAN version of ColOpenData with:

``` r
install.packages("ColOpenData")
```

You can also install the development version of ColOpenData from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("epiverse-trace/ColOpenData")
```

## Quick Overview

**ColOpenData** contains data from two public data sources: Departamento
Administrativo Nacional de Estadística (DANE), and Instituto de
Hidrología, Meteorología y Estudios Ambientales (IDEAM). The available
data is divided in four categories:

- **Demographic:** Demographic and Socioeconomic data presents
  information from the National Population and Dwelling Census (CNPV)
  of 2018. The CNPV data corresponds to the most recent census available
  to date and the information is presented as an answer to three
  questions: How many are we?, Where are we? and How do we live?

- **Geospatial:** This data is retrieved from the National
  Geostatistical Framework (MGN), which includes maps and a summarized
  version of the 2018 CNPV, aggregated to spatial geometries. The data
  is available at different aggregation levels including: Blocks, Urban
  and Rural Sections, Urban and Rural Sectors, Urban Areas,
  Municipalities and Departments.

- **Climate:** Climate data is recovered from backup information
  provided by IDEAM, containing historical data from the first station
  in the country (January 1st 1920) until May 31st 2023. This backup
  includes temperature, precipitation, sunshine duration, wind
  direction, among others.

- **Population projections:** Population Projections data contains the
  population projections and back projections from 1950 to 2070,
  considering the post COVID-19 update, which was calculated based on
  the results of 2018 CNPV.

Documentation and vignettes are available for the modules in the [user
vignettes](https://epiverse-trace.github.io/ColOpenData/).

### Similar R Packages

Similar R packages are offered for international communities, allowing
the user to download census, geospatial and climate data.

- [cancensus](https://mountainmath.github.io/cancensus/): Canada
- [censobr](https://ipeagit.github.io/censobr/): Brazil
- [chilemapas](https://github.com/pachadotdev/chilemapas/): Chile
- [geobr](https://ipeagit.github.io/geobr/) : Brazil
- [georAr](https://github.com/PoliticaArgentina/geoAr): Argentina
- [geouy](https://github.com/RichDeto/geouy): Uruguay
- [tidycensus](https://walker-data.com/tidycensus/): US
- [geofi](https://ropengov.github.io/geofi/): Finland
- [climate](https://bczernecki.github.io/climate/)

### Disclaimer

ColOpenData stores and distributes open data originally obtained from
Departamento Administrativo Nacional de Estadística (DANE), and
Instituto de Hidrología, Meteorología y Estudios Ambientales (IDEAM). It
is important to note that the data retrieved from these sources has been
processed, transformed, and adapted to meet the functional requirements
of this package. These modifications may result in changes to the
structure, format, or content of the original data, and as such, the
data provided by this package does not represent the official datasets
as maintained by IDEAM or DANE. The development of this package is
completely independent of these institutions, and neither IDEAM, DANE,
nor any other Colombian government body endorses, sponsors, or is
involved in the creation or maintenance of this package. Consequently,
they bear no responsibility for the data as presented within this
package. Furthermore, the authors of the ColOpenData assume no liability
for any outcomes resulting from the use or misuse of the data provided.
The user is solely responsible for how they utilize the data, and any
conclusions drawn, analyses performed, or actions taken based on this
data are the user’s responsibility. This package and its authors make no
claims to represent or act on behalf of IDEAM, DANE, or any other
official entity.

### Lifecycle

This package is currently *stable*, as defined by the [RECON software
lifecycle](https://www.reconverse.org/lifecycle.html). Therefore, this
is a functional package and it is documented and tested. However, it
still may change over time.

### Contributions

Contributions are welcome via [pull
requests](https://github.com/epiverse-trace/ColOpenData/pulls).

### Code of Conduct

Please note that the ColOpenData project is released with a [Contributor
Code of
Conduct](https://github.com/epiverse-trace/.github/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

### Funding

This work is part of the TRACE-LAC research project funded by the
International Research Centre (IDRC) Ottawa, Canada.\[109848-001-\].
