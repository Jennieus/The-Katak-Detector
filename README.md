# The Katak Detector
A Shiny app and R project for UM MDatSc WQD7001 Principles of Data Science course.

- [Shiny app link](https://yuenherny.shinyapps.io/thekatakdetector/)
- [Slidy link](https://rpubs.com/Kirah/frogdetector)

## Course Info
Name: Principles of Data Science

Code: WQD7001

Repo type: Group project

## Dataset Origin
- [EY's Building a Better Working World Challenge](https://challenge.ey.com/challenges/level-1-local-frog-discovery-tool-SXnArnHsm/data-description)
- Period: 2020 - 2022 (due to Shiny app limitation)

## Project Structure
1. Shiny app files are in the root directory: `app.R`, `util.R`, `occurrence_2020.xlsx`, `www/`, `FrogDetector.Rmd`.
   - `app.R`: Main R file for Shiny app.
   - `util.R`: Utilities R file for dataframe generation according to user inputs.
   - `www/`: Contains app background images.
   - `FrogDetector.Rmd`: R Markdown file for `About` page.
3. `occurrence_2020.xlsx` is the reduced dataset used for Shiny development due to free tier limitation.
4. `dataset` folder contains the full dataset from EY.
5. `rmarkdown` folder contains the R Markdown files for dataset analysis.
6. `rsconnect` folder contains the info of the deployed Shiny app.

## How to use this Repository
1. Install R and RStudio (or any IDE you like) if you have not done so.
2. Clone the repository to your local.
3. [Open the project as a new R project.](https://support.rstudio.com/hc/en-us/articles/200526207-Using-RStudio-Projects)
4. Have fun!

## Team
- [NURHANIE SYAKIRAH ROSNEI](https://github.com/Jennieus)
- [YU YUEN HERN](https://github.com/yuenherny)
- DONG XIAORAN
- [NOR SHAFFILZA BINTI MOHD KAMIL](https://github.com/Shaffilza) 
- AINAA SHAMSUDDIN

## Disclaimer
This is a project developed for educational purposes. 
Commercial usage are welcomed but the authors and developers are not liable for any losses incurred due to the use of this repository.
Please refer to the Apache 2.0 license for more information.
