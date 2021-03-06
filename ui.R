require(rCharts)
shinyUI(pageWithSidebar(
headerPanel("Visualizing College Football With rCharts: By Tyler Hunt"),

sidebarPanel(
  HTML('<style type="text/css">
        .row-fluid .span4{width: 21%;}
        </style>
       <a href="http://psychoanalytix.com"> <img src="Logo_transparent_background.png"></a>'),
  
selectInput(inputId = "x",
            label = "Choose X",
            choices = c('Rank', 'Score', 'Elo', 'TrueMargin', 'Wins', 'Losses'),
            selected = "Elo"),

selectInput(inputId = "y",
            label = "Choose Y",
            choices = c('Rank', 'Score', 'Elo', 'TrueMargin', 'Wins', 'Losses'),
            selected = "TrueMargin"),

selectInput(inputId = "grp",
            label = "Choose Group",
            choices = c('Conference', 'Wins', 'Losses'),
            selected = "Conference"),

selectInput(inputId = "size",
            label = "Choose Size",
            choices = c('Rank', 'Score', 'Elo', 'TrueMargin', 'Wins', 'Losses'),
            selected = "Score"),

helpText("Conference Key:",
         br(),
         "1 = American Athletic Conference",
         br(),
         "2 = Atlantic Coast Conference",
         br(),
         "3 = Big 12 Conference",
         br(),
         "4 = Big Ten Conference",
         br(),
         "5 = Conference USA",
         br(),
         "6 = Independent",
         br(),
         "7 = Mid-American Conference",
         br(),
         "8 = Mountain West Conference",
         br(),
         "9 = PAC-12 Conference",
         br(),
         "10 =Southeastern Conference",
         br(),
         "11 = Sun Belt Conference")

),
mainPanel(
  div(class='wrapper',
      tags$style(".Nvd3{ height: 600px; width: 900px;}"),
      showOutput("myChart","nvd3")
  ))
))

