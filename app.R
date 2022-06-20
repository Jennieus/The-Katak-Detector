# Load library
library(plyr)
library(sf)
library(dplyr)
library(pastecs)
library(tidyverse)
# library(urbnmapr)
library(readxl)
library(readr)
library(shiny)
library(leaflet)
library(htmltools)
library(ggplot2)
source('util.R')

backgroundImageCSS <- "/* background-color: #cccccc; */
                       height: 91vh;
                       background-position: center;
                       background-repeat: no-repeat;
                       /* background-size: cover; */
                       background-image: url('%s');
                       "

ui <- fluidPage(
        navbarPage("The Katak Detector", 
                  collapsible = TRUE, inverse = TRUE,
                 
        tabPanel("Hi!",
                 style = sprintf(backgroundImageCSS, "first_tab_bg.png")
                 ),
                 
        tabPanel("Frog Count in Year", 
                  sidebarLayout(
                    sidebarPanel = sidebarPanel(
                      selectInput(inputId = "date_year", 
                                label = "Year: ",
                                choices = 2020:2022,
                                selected = 2022
                                )
                    ),
                    mainPanel = mainPanel(
                      textOutput(outputId = "year"),
                      plotOutput(outputId = "countBar")
                    ),
                  ),
                 style = sprintf(backgroundImageCSS, "all_tab_bg.png")
                    
        ),
        tabPanel("Frog Count over Time", 
                 sidebarLayout(
                   sidebarPanel = sidebarPanel(
                     dateRangeInput(inputId = "date_range",
                                    label = "Date range:",
                                    start = "2020-01-01"
                                    )
                     
                   ),
                  mainPanel = mainPanel(
                    plotOutput(outputId = "countOverTime")
                  )
                 ),
                style = sprintf(backgroundImageCSS, "all_tab_bg.png")
      ),
      tabPanel("About",
               includeMarkdown('FrogDetector.Rmd'),
               style = sprintf(backgroundImageCSS, "about_me_bg.png")
               )
  )
)

server <- function(input, output) {
  
  output$countOverTime <- renderPlot({
    
    df <- countOverTimeData(input$date_range)
    
    df %>%
      ggplot(aes(x = eventDate, y = Freq, color = species)) + 
        geom_line(aes(group = species)) + 
        geom_point()
  })
  
  output$year <- renderText({
    
    paste("Frog Count by Species in Year", input$date_year)
    
    })
  
  output$countBar <- renderPlot({
    
    df <- countBarData(input$date_year)
    
    df %>% 
      # filter((species == "Litoria fallax")) %>% # reactive input here
      ggplot(aes(x = Freq, y = species)) + 
      geom_col(aes(fill = species))
    
  })
  
  
  
  # output$countMap <- renderLeaflet({
  # 
  #   df <- countMapData(input$date_year)
  #   pal <- colorFactor(
  #     palette = "YlGnBu",
  #     domain = df$species
  #   )
    
    # marker_icon <- makeIcon(
    #   iconUrl = "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.8.0-beta.0/images/marker-icon.png",
    #   shadowUrl = "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.8.0-beta.0/images/marker-shadow.png",
    # )
    
    # leaflet(df) %>%
    #   addTiles() %>%
    #   addCircleMarkers(lng = ~decimalLongitude, lat = ~decimalLatitude, 
    #                    color = ~pal(species),
    #                    popup = ~as.character(species),
    #                    label = ~as.character(eventDate),
    #                    radius = 5,
    #                    fill = TRUE) %>%
    #   addLabelOnlyMarkers(lng = ~decimalLongitude, lat = ~decimalLatitude, 
    #                       label = ~as.character(species)) %>%
    #   addLegend(position = "bottomright", pal = pal,
    #             values = ~species,
    #             title = "Species",
    #             opacity = 1)
      
  # })
  
}

shinyApp(ui, server)