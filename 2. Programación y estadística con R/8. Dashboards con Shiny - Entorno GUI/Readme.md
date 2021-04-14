# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Ambiente de trabajo UI y Server)](#Ejemplo-1)
  * [Ejemplo 2 (Creación de un Dashboard con pestañas y data tables)](#Ejemplo-2)
  * [Ejemplo 3 (Dashboard dinámico)](#Ejemplo-3)
  * [Ejemplo 4 (Dashboard condicional)](#Ejemplo-4)
  * [Ejemplo 5 (Dashboard interactivo ejecutivo)](#Ejemplo-5)
  * [Ejemplo 6 (Publica tu dashboard)](#Ejemplo-6)

* [Retos](#Retos)
  * [ ] [Reto 1 (Crear un Dashboard con pestañas)](#Reto-1)
  * [ ] [Reto 2 (Dashboard dinámico)](#Reto-2)
  * [ ] [Reto 3 (Generar un dashboard de tipo profesional)](#Reto-3)

# Ejemplos

## Ejemplo 1
```r

# Ejemplo 8.1 server

library(shiny)

shinyServer(function(input, output) { 
    output$output_text <- renderText(paste("Grafico de mpg ~ ", input$x))     # input$x es la selección que se hizo en la UI
    output$output_plot <- renderPlot(plot(as.formula(paste("mpg~", input$x)), 
                                          data = mtcars))
}
)


# Ejemplo 8.1 ui

library(shiny)
shinyUI(
    
    pageWithSidebar(
        
        headerPanel ("Aplicacion simple con Shiny"),
        
        sidebarPanel (
            p("Vamos a crear plots con el dataset de 'mtcars'"),
            selectInput("x", "Selecciona el eje de las X",        # Se indica que la variable "x" será la de entrada
                        choices = colnames(mtcars) )               # Sirve para desplegar las variables a graficar en este caso son todas las de mtcars
        ),
        mainPanel (h3(textOutput("output_text")), 
                   plotOutput("output_plot")
        )
    )
)
```

## Ejemplo 2
```r
# Ejemplo 8.2 Normal con Labels   SERVER

library(shiny)
library(dplyr)
library(stringr)

shinyServer(function(input, output) {
    
    output$output_text <- renderText(paste("mpg~", input$x))
    
    #Gráficas  
    output$output_plot <- renderPlot({ plot( as.formula(paste("mpg ~", input$x)),
                                             data = mtcars) })
    
    #imprimiendo el summary                                  
    output$summary <- renderPrint({
        mtcars %>%  filter(str_detect(rownames(mtcars), 'Mer') & mpg >20 )
    })
    
    # Agregando el dataframe
    output$table <- renderTable({ 
        data.frame(mtcars)
    })
    
    #Agregando el data table
    output$data_table <- renderDataTable({mtcars}, 
                                         options = list(aLengthMenu = c(5,25,50),
                                                        iDisplayLength = 5))
    
    
})


# Ejemplo 8.2 Normal con Labels UI

library(class)
library(dplyr)
library(stringr)

library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)

shinyUI(
    pageWithSidebar(
        headerPanel("Aplicacion básica con Shiny"),
        sidebarPanel(
            p("Crear plots con el DF 'auto'"), 
            selectInput("x", "Seleccione el valor de X",
                        choices = names(mtcars))
        ),
        mainPanel(
            
            
            #Agregando pestaÃ±as
            tabsetPanel(
                tabPanel("Plots",   #Pestaña de Plots
                         h3(textOutput("output_text")), 
                         plotOutput("output_plot"), 
                ),
                
                tabPanel("imágenes",  #Pestaña de imágenes
                         img( src = "cor_mtcars.png", 
                              height = 200, width = 200)
                ), 
                
                tabPanel("Dplyr", verbatimTextOutput("summary")),
                
                tabPanel("Table", tableOutput("table")),
                tabPanel("Data Table", dataTableOutput("data_table"))
            )
        )
    )
    
)
```

## Ejemplo 3
```r
# Ejemplo 8.3 SERVER

# Generación de un dashboard de tipo de selección dinámica

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    datasetImput <- reactive(
        switch(input$dataset, 
               "rock" = rock, 
               "mtcars" = mtcars, 
               "iris" = iris)
    )
    
    output$var <- renderUI({
        
        radioButtons("varname", 
                     "elige una variable", 
                     names(datasetImput()))
    })
    
    output$plot <- renderPlot({
        if(!is.null(input$varname)){
            if(!input$varname %in% names(datasetImput())){
                colname <- names(datasetImput())[1]
                
            } else {
                colname <- input$varname
            }
            hist(datasetImput()[,colname],
                 main = paste("Histograma de", colname), 
                 xlab = colname)
        }
        
    })
    
})


# Ejemplo 8.3 UI

# Generación de un dashboard de tipo de selección dinámica

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Elecciones dinámicas de Data Frames"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", "Selección del dataset", 
                        c("mtcars", "rock", "iris")), 
            uiOutput("var")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(plotOutput("plot")
        )
    )
))
```

## Ejemplo 4
```r
# Ejemplo 8.4 SERVER

#Condicional

library(shiny)


shinyServer(function(input, output) {
    
    output$plot <- renderPlot({
        if (input$plot_type == "histogram") {
            hist(mtcars[,input$x], xlab =input$x, main = paste("Histograma de",input$x) )
            
        }  else  {
            plot(mtcars[,input$x], mtcars$hp, xlab = input$x, ylab = "hp")
        }      
        
    })
    
})


# Ejemplo 8.4 UI

#Condicional
library(shiny)


shinyUI(fluidPage(
    
    # Application title
    titlePanel("Elecciones condicionales"),
    
    # Sidebar with a slider input for number of bins
    sidebarPanel(
        selectInput("plot_type", "Tipo de Gráfica", 
                    c("Gráfica de dispersión" = "Scatter", 
                      "Histograma" = "histogram")) ,
        
        conditionalPanel(condition = "input.plot_type != 'Scatter' ",
        ),
        
        conditionalPanel(condition = "input.plot_type != 'histogram' ", 
                         selectInput("x", "Selecciona la variable en eje X", 
                                     choices = names(mtcars)
                         ))
        
        
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("plot")
    )
)
)
```

## Ejemplo 5
```r
# Ejemplo 8.5 APP.R

## app.R ##

## Dash board para el data set 'mtcars'

library(shiny)
library(shinydashboard)
#install.packages("shinythemes")
library(shinythemes)

#Esta parte es el análogo al ui.R
ui <- 
    
    fluidPage(
        
        dashboardPage(
            
            dashboardHeader(title = "Basic dashboard"),
            
            dashboardSidebar(
                
                sidebarMenu(
                    menuItem("Histograma", tabName = "Dashboard", icon = icon("dashboard")),
                    menuItem("Dispersión", tabName = "graph", icon = icon("area-chart")),
                    menuItem("Data Table", tabName = "data_table", icon = icon("table")),
                    menuItem("Imágen", tabName = "img", icon = icon("file-picture-o"))
                )
                
            ),
            
            dashboardBody(
                
                tabItems(
                    
                    # Histograma
                    tabItem(tabName = "Dashboard",
                            fluidRow(
                                titlePanel("Histograma de las variables del data set mtcars"), 
                                selectInput("x", "Seleccione el valor de X",
                                            choices = names(mtcars)),
                                
                                selectInput("zz", "Selecciona la variable del grid", 
                                            
                                            choices = c("cyl", "vs", "gear", "carb")),
                                box(plotOutput("plot1", height = 250)),
                                
                                box(
                                    title = "Controls",
                                    sliderInput("bins", "Number of observations:", 1, 30, 15)
                                )
                            )
                    ),
                    
                    # Dispersión
                    tabItem(tabName = "graph", 
                            fluidRow(
                                titlePanel(h3("Gráficos de dispersión")),
                                selectInput("a", "Selecciona el valor de x",
                                            choices = names(mtcars)),
                                selectInput("y", "Seleccione el valor de y",
                                            choices = names(mtcars)),
                                selectInput("z", "Selecciona la variable del grid", 
                                            choices = c("cyl", "vs", "gear", "carb")),
                                box(plotOutput("output_plot", height = 300, width = 460) )
                                
                            )
                    ),
                    
                    
                    
                    tabItem(tabName = "data_table",
                            fluidRow(        
                                titlePanel(h3("Data Table")),
                                dataTableOutput ("data_table")
                            )
                    ), 
                    
                    tabItem(tabName = "img",
                            fluidRow(
                                titlePanel(h3("Imágen de calor para la correlación de las variables")),
                                img( src = "cor_mtcars.png", 
                                     height = 350, width = 350)
                            )
                    )
                    
                )
            )
        )
    )

#De aquí en adelante es la parte que corresponde al server

server <- function(input, output) {
    library(ggplot2)
    
    #Gráfico de Histograma
    output$plot1 <- renderPlot({
        
        x <- mtcars[,input$x]
        bin <- seq(min(x), max(x), length.out = input$bins + 1)
        
        ggplot(mtcars, aes(x, fill = mtcars[,input$zz])) + 
            geom_histogram( breaks = bin) +
            labs( xlim = c(0, max(x))) + 
            theme_light() + 
            xlab(input$x) + ylab("Frecuencia") + 
            facet_grid(input$zz)
        
        
    })
    
    # Gráficas de dispersión
    output$output_plot <- renderPlot({ 
        
        ggplot(mtcars, aes(x =  mtcars[,input$a] , y = mtcars[,input$y], 
                           colour = mtcars[,input$z] )) + 
            geom_point() +
            ylab(input$y) +
            xlab(input$a) + 
            theme_linedraw() + 
            facet_grid(input$z)  #selección del grid
        
    })   
    
    #Data Table
    output$data_table <- renderDataTable( {mtcars}, 
                                          options = list(aLengthMenu = c(5,25,50),
                                                         iDisplayLength = 5)
    )
    
}


shinyApp(ui, server)
```

## Ejemplo 6
```r
# Ejemplo 6. Publica tu dashboard 

#### Objetivo 
Realizar la publicación de tu dashboard dentro de un servidor ya sea de Shiny o de RStudio, para poder compartirlo a traves de internet y que los que tengan el link puedan hacer uso del dashboard

#### Requisitos
- Haber realizado los ejemplos de la sesión
- Tener un dashboard
- Conexión a internet

#### Desarrollo

Para el desarrollo de este ejemplo se adjunta el siguiente video en el que puedes visualizar como se comparte un dashboard, es una tarea sencilla para comenzar a la publicación de tus dashboards.

[![](portada.png)](https://www.loom.com/share/aca22ba5b4034823a61c004bb8727f7a)
```
https://www.loom.com/share/aca22ba5b4034823a61c004bb8727f7a

# Retos

## Reto 1
```r

```

## Reto 2
```r

```

## Reto 3
```r

```
