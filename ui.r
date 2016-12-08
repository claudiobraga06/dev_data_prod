
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Forecast Specie"),
  sidebarPanel(
    
    p('SEPAL:'),
    numericInput('SLen', 'Length', 5.8, min = 4.0, max = 8.0, step= 0.1),
    numericInput('Swid', 'Width', 3.0, min = 2.0, max = 4.5, step= 0.1),
    p('PETAL:'),
    numericInput('PLen', 'Length', 3.7, min = 1.0, max = 7.0, step= 0.1),
    numericInput('Pwid', 'Width', 1.2, min = 0.0, max = 2.5, step= 0.1)
      ),
  mainPanel(
    h4('DOCUMENTATION'),
    h5("This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica."),
    h5("This application allow forecast the specie. Inform the sepal length and width and petal length and width. The application will show the position of your data relatively with the IRIS data and will forecast the Species with accuracy of 95%."),
    h3('FORECAST'),
    htmlOutput('Resultado'),
    plotOutput("plot1"),
    h4('LEGEND:'),
    h6('GREEN - Virginica',style = "color:green"),
    h6('RED - Versicolor',style = "color:red"),
    h6('BLACK - Setosa')
    
  )
))
