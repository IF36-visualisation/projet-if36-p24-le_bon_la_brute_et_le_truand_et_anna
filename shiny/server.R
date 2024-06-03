library(shiny)
library(dplyr)
library(ggplot2)

server <- function(input, output) {
  
  spotify_data <- reactive({
    read.csv("../data/spotify-2023.csv")
  })
  
  spotify22_data <- reactive({
    read.csv("../data/spotify_top_charts_22.csv")
  })
  
  output$spotifyCount <- renderValueBox({
    valueBox(
      value = spotify_data() %>% nrow(),
      subtitle = "Nombre de musiques dans spotify_data",
      icon = icon("music"),
      color = "blue"
    )
  })
  
  output$spotify22Count <- renderValueBox({
    valueBox(
      value = spotify22_data() %>% nrow(),
      subtitle = "Nombre de musiques dans spotify22_data",
      icon = icon("music"),
      color = "green"
    )
  })
  
  output$spotifyStreams <- renderValueBox({
    data <- spotify_data() %>% slice(1:input$slider)
    data$streams <- as.numeric(data$streams)
    valueBox(
      value = sum(data$streams),
      subtitle = paste("Total des streams dans spotify_data des ",input$slider," premières musiques"),
      icon = icon("play"),
      color = "blue"
    )
  })
  
  output$spotify22Streams <- renderValueBox({
    valueBox(
      value = sum(spotify22_data()$streams),
      subtitle = "Total des streams dans spotify22_data",
      icon = icon("play"),
      color = "green"
    )
  })
  
  output$streamsPlot <- renderPlot({
    data <- rbind(cbind(spotify_data(), dataset = "spotify_data"), cbind(spotify22_data(), dataset = "spotify22_data"))
    ggplot(data, aes(x = dataset, y = streams, fill = dataset)) +
      geom_bar(stat = "identity", position = "dodge") +
      theme_minimal() +
      labs(title = "Comparaison des Streams",
           x = "Dataset",
           y = "Streams") +
      theme(plot.title = element_text(hjust = 0.5))
  })
  
  output$featurePlot <- renderPlot({
    data <- rbind(cbind(spotify_data(), dataset = "spotify_data"), cbind(spotify22_data(), dataset = "spotify22_data"))
    if (input$chart_type == "Bar Plot") {
      ggplot(data, aes_string(x = "dataset", y = input$color, fill = "dataset")) +
        geom_bar(stat = "identity", position = "dodge") +
        theme_minimal() +
        labs(title = paste("Comparaison de", input$color),
             x = "Dataset",
             y = input$color) +
        theme(plot.title = element_text(hjust = 0.5))
    } else if (input$chart_type == "Line Plot") {
      ggplot(data, aes_string(x = "dataset", y = input$color, color = "dataset", group = "dataset")) +
        geom_line() +
        geom_point() +
        theme_minimal() +
        labs(title = paste("Comparaison de", input$color),
             x = "Dataset",
             y = input$color) +
        theme(plot.title = element_text(hjust = 0.5))
    } else if (input$chart_type == "Scatter Plot") {
      ggplot(data, aes_string(x = input$feature, y = input$color, color = "dataset")) +
        geom_point() +
        theme_minimal() +
        labs(title = paste("Comparaison de", input$feature, "et", input$color),
             x = input$feature,
             y = input$color) +
        theme(plot.title = element_text(hjust = 0.5))
    }
  })
}
