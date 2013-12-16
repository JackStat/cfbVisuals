
require(shiny)
require(rCharts)
require(plyr)
options(RCHART_WIDTH = 900, RCHART_HEIGHT = 600)

ranks<-read.csv("Data/y2013w14Rank.csv")
names(ranks) = gsub("\\.", "", names(ranks))
ranks<-ranks[rowSums(cbind(ranks$Wins, ranks$Losses))>5,]

ranks$Conference<-droplevels(ranks$Conference)

ranks$Conference<-as.numeric(ranks$Conference)

shinyServer(function(input, output) {
  formulaText <- reactive({
  paste(input$x, "~", input$y)
  })
  
  sizing <- reactive({
    paste("#! function(d){return d.", input$size, "} !#", sep="")
  })
  
  reactive({
    ranks<-arrange(ranks, input$grp)
  })

  output$myChart <- renderChart({
  
  n1 <- nPlot(as.formula(formulaText()), 
              data = ranks,
              group=input$grp,
              type = 'scatterChart')
  
#n1$chart(size = '#! function(d){return d.Score} !#')
  n1$chart(size = sizing())
 
  n1$chart(tooltipContent= "#! function(key, x, y, e){
  return '<b>Team:</b> ' + e.point.Team + '<br/>' +
    '<b>Rank: </b>' + e.point.Rank + '<br/>' + 
    '<b>Score: </b>' + e.point.Score + '<br/>' +  
    '<b>Wins: </b>' + e.point.Wins + '<br/>' + 
    '<b>Losses: </b>' + e.point.Losses
} !#")
  
  #n1$set(width = 800, height = 600, legendPosition = "bottom")
  
  n1$addParams(dom = 'myChart')

  return(n1)

  })
})
