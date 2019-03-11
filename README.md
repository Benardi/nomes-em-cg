[![Build Status](https://img.shields.io/badge/R%3E%3D-3.3.3-6666ff.svg)](https://cran.r-project.org/doc/FAQ/R-FAQ.html)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Avenues of Campina Grande

Exploratory data analysis of avenue names in the city of Campina Grande - PB

## Data

In April of 2018, I requested to the city hall of Campina Grande - PB the names of all the city's avenues. The staff of the Secretaria de Planejamento (loosely translated as planning department) kindly sent me not only the list of names, but also a series of other information about the avenue names. The raw data are a shapefile at `data/vias_cg.rar`, and are the result of a city survey done between 2010 and 2013.  

From these data, I extracted the csv `data/vias_cg.csv` using the [mapshaper](http://mapshaper.org/) and I derived a set of variables I deemed interesting about the avenues at `data/vias-tidy.csv`. The script for that second part is `code/import_data`

## Execution

The application can be found at [vias-app website](https://benardi.shinyapps.io/vias-app/). To execute your own version of the application run the `vias-app/server.R` and `vias-app/ui.R`

## Prerequisites

* `R >= 3.3.3`
* colourlovers
* tidyverse
* viridis
* skimr
* shiny
* here

## Authors

* **Benardi Nunes** - *Building web page* - [Benardi](https://github.com/Benardi)
* **Nazareno** - *Data Acquisition* - [Nazareno](https://github.com/nazareno)

## License

This project is licensed under the GPL v3 License - see the [LICENSE.md](LICENSE.md) file for details
