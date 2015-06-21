library(shiny)
library(googleVis)

shinyUI(
  fluidPage(
    h1("US STATE FACTS AND FIGURES BY REGION", align="center"),
    br(),
    fluidRow(
      column(2, 
        wellPanel( 
          helpText("Select a region in the United States"),
          selectInput(inputId="region", label="Region:", 
            choices=list("Northeast", "South" , "North Central", "West"))
        )
      ),
      column(10, 
        fluidRow(
          column(6,
            h4("Population of states in selected region (July 1, 1975)"),
            htmlOutput('popMap')
          ),
          column(6,
            htmlOutput('incomeChart')
          )
        ),      
        fluidRow(
          column(6,
                 htmlOutput('lifeExpectancyChart')
          ),
          column(6,
                 htmlOutput('illiteracyChart')
          )
        )      
      )
    )       
  )
)