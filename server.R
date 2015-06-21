library(shiny)
library(datasets)
library(googleVis)

#Load the state dataset and create a dataframe by combining all the columns we are interested in
data(state)
stateData <- as.data.frame(state.x77)
stateData <- cbind(state.region, stateData)
stateData <- cbind(state.division, stateData)
stateData <- cbind(state.abb, stateData)
stateData <- cbind(state.name, stateData)

shinyServer(
  function(input, output) {
    
    #Subsets the state dataframe for the region entered in the ui 
    getSubset<- function()
    {
      return(subset(stateData, state.region==input$region))
    }
    
    
    output$selRegion = renderPrint({input$region})
    output$popMap = renderGvis({gvisGeoMap(data=getSubset(), locationvar="state.name", numvar="Population", 
                                           options=list(region="US", displayMode="states", height=600, title="Population of states in selected region (July 1,1975)"))})
    
    output$incomeChart = renderGvis({gvisBarChart(data=getSubset(), xvar="state.abb", yvar="Income", 
                                                options=list(legend='none', height=600, title="Per capita Income of states in selected region(1974)"))})
    
    output$lifeExpectancyChart = renderGvis({gvisBarChart(data=getSubset(), xvar="state.abb", yvar="Life Exp", 
                                                options=list(legend='none', height=600, title="Life Expectancy in years(1969-71"))})
    
    output$illiteracyChart = renderGvis({gvisBarChart(data=getSubset(), xvar="state.abb", yvar="Illiteracy", 
                                                          options=list(legend='none', height=600, title="Illiteracy Percent(1970)"))})

  }
)
