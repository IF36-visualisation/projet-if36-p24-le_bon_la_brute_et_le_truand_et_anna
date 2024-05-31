library(shiny)
library(dplyr)
library(ggplot2)

server <- function(input, output) {
  starwars_data <- reactive({
    starwars %>% filter(!is.na(height), !is.na(mass))
  })
  
  output$scatterPlot <- renderPlot({
    data <- starwars_data() %>% slice(1:input$slider)
    ggplot(data, aes(x = mass, y = height, color = species)) +
      geom_point(size = 3) +
      theme_minimal() +
      labs(title = "Height & Mass Correlation",
           x = "Mass (kg)",
           y = "Height (cm)") +
      theme(plot.title = element_text(hjust = 0.5))
  })
  
  output$colorPlot <- renderPlot({
    data <- starwars_data() %>% slice(1:input$slider)
    ggplot(data, aes_string(x = input$color)) +
      geom_bar(fill = "grey", color = "black") +
      theme_minimal() +
      labs(title = paste("Distribution of", input$color),
           x = input$color,
           y = "Count") +
      theme(plot.title = element_text(hjust = 0.5))
  })
  
  output$fixedBox <- renderValueBox({
    valueBox(
      value = 42,
      subtitle = "Box fixe",
      icon = icon("bars"),
      color = "aqua"
    )
  })
  
  output$individualsBox <- renderValueBox({
    data <- starwars_data() %>% slice(1:input$slider)
    valueBox(
      value = nrow(data),
      subtitle = "Individus",
      icon = icon("users"),
      color = "red"
    )
  })
  
  output$dimensionsBox <- renderValueBox({
    valueBox(
      value = length(unique(names(starwars))),
      subtitle = "Dimensions",
      icon = icon("cubes"),
      color = "orange"
    )
  })
  
  output$avgHeightBox <- renderInfoBox({
    data <- starwars_data() %>% slice(1:input$slider)
    avg_height <- round(mean(data$height, na.rm = TRUE), 1)
    infoBox(
      title = "AVERAGE HEIGHT (CM)",
      value = avg_height,
      icon = icon("arrow-up"),
      color = "purple"
    )
  })
  
  output$medianMassBox <- renderInfoBox({
    data <- starwars_data() %>% slice(1:input$slider)
    median_mass <- round(median(data$mass, na.rm = TRUE), 1)
    infoBox(
      title = "MEDIAN MASS (KG)",
      value = median_mass,
      icon = icon("weight"),
      color = "black"
    )
  })
}
