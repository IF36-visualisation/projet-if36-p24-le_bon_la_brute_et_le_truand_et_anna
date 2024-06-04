library(shiny)
library(dplyr)
library(ggplot2)
library(shinydashboard)
library(reshape2)

server <- function(input, output) {
  
  # Function to read CSV with encoding
  read_csv_with_encoding <- function(file) {
    read.csv(file, encoding = "UTF-8")
  }
  
  spotify_data <- reactive({
    read_csv_with_encoding("../data/spotify-2023.csv") %>%
      mutate(track_name = iconv(track_name, from = "UTF-8", to = "ASCII//TRANSLIT"))
  })
  
  spotify22_data <- reactive({
    read_csv_with_encoding("../data/spotify_top_charts_22.csv") %>%
      mutate(track_name = iconv(track_name, from = "UTF-8", to = "ASCII//TRANSLIT"))
  })
  
  unpopular_data <- reactive({
    read_csv_with_encoding("../data/unpopular_songs.csv") %>%
      mutate(track_name = iconv(track_name, from = "UTF-8", to = "ASCII//TRANSLIT"))
  })
  
  # Render value boxes
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
  
  output$spotifyUnpopular <- renderValueBox({
    valueBox(
      value = unpopular_data() %>% nrow(),
      subtitle = "Nombre de musiques dans unpopular_data",
      icon = icon("music"),
      color = "red"
    )
  })
  
  output$spotify23_dimension <- renderValueBox({
    valueBox(
      value = ncol(spotify_data()),
      subtitle = "Dimensions de spotify_data",
      icon = icon("table"),
      color = "blue"
    )
  })
  
  output$spotify22_dimension <- renderValueBox({
    valueBox(
      value = ncol(spotify22_data()),
      subtitle = "Dimensions de spotify22_data",
      icon = icon("table"),
      color = "green"
    )
  })
  
  output$unpopular_dimension <- renderValueBox({
    valueBox(
      value = ncol(unpopular_data()),
      subtitle = "Dimensions de unpopular_data",
      icon = icon("table"),
      color = "red"
    )
  })
  
  output$spotifyStreams <- renderValueBox({
    data <- spotify_data() %>% slice(1:input$numSongs)
    data$streams <- as.numeric(data$streams)
    valueBox(
      value = sum(data$streams, na.rm = TRUE),
      subtitle = paste("Total des streams dans spotify_data des", input$numSongs, "premières musiques"),
      icon = icon("play"),
      color = "blue"
    )
  })
  
  # Render popularity plots
  output$popularitySpotify23 <- renderPlot({
    data <- spotify_data() %>% slice(1:input$numSongs)
    data$streams <- as.numeric(data$streams)
    ggplot(data, aes(x = reorder(track_name, -streams), y = streams)) +
      geom_bar(stat = "identity", fill = "blue") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Popularité des chansons sur Spotify en 2023", x = "Chanson", y = "Streams")
  })
  
  output$popularitySpotify22 <- renderPlot({
    data <- spotify22_data() %>% slice(1:input$numSongs)
    ggplot(data, aes(x = reorder(track_name, -peak_rank), y = peak_rank)) +
      geom_bar(stat = "identity", fill = "red") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Popularité des chansons sur Spotify en 2022", x = "Chanson", y = "Classement maximal")
  })
  
  # Render correlation plots
  output$corrDanceabilityStreams23 <- renderPlot({
    data <- spotify_data() %>% slice(1:input$numSongs)
    data$danceability <- as.numeric(data$danceability)
    data$streams <- as.numeric(data$streams)
    ggplot(data, aes(x = danceability, y = streams)) +
      geom_point(color = "blue") +
      theme_minimal() +
      labs(title = "Corrélation entre Danceability et Streams (2023)", x = "Danceability", y = "Streams")
  })
  
  output$corrDanceabilityRank22 <- renderPlot({
    data <- spotify22_data() %>% slice(1:input$numSongs)
    data$danceability <- as.numeric(data$danceability)
    data$peak_rank <- as.numeric(data$peak_rank)
    ggplot(data, aes(x = danceability, y = peak_rank)) +
      geom_point(color = "red") +
      theme_minimal() +
      labs(title = "Corrélation entre Danceability et Classement (2022)", x = "Danceability", y = "Classement maximal")
  })
  
  output$heatmapCorr23 <- renderPlot({
    data <- spotify_data() %>% slice(1:input$numSongs)
    corr_data <- data %>% select(danceability_., valence_., energy_., acousticness_., instrumentalness_., liveness_., speechiness_., streams) %>% 
      mutate(across(everything(), as.numeric))
    corr_matrix <- cor(corr_data, use = "complete.obs")
    melted_corr_matrix <- melt(corr_matrix)
    ggplot(melted_corr_matrix, aes(Var1, Var2, fill = value)) +
      geom_tile() +
      scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1)) +
      theme_minimal() +
      labs(title = "Heatmap des corrélations (2023)", x = "", y = "")
  })
  
  
  output$heatmapCorr22 <- renderPlot({
    data <- spotify22_data() %>% slice(1:input$numSongs)
    corr_data <- data %>% select(danceability, energy, acousticness, instrumentalness, liveness, speechiness, peak_rank) %>% 
      mutate(across(everything(), as.numeric))
    corr_matrix <- cor(corr_data, use = "complete.obs")
    melted_corr_matrix <- melt(corr_matrix)
    ggplot(melted_corr_matrix, aes(Var1, Var2, fill = value)) +
      geom_tile() +
      scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1)) +
      theme_minimal() +
      labs(title = "Heatmap des corrélations (2022)", x = "", y = "")
  })
  
  # Render box plots
  output$boxplotStreamsDanceability23 <- renderPlot({
    data <- spotify_data() %>% slice(1:input$numSongs)
    data$danceability <- as.numeric(data$danceability)
    data$streams <- as.numeric(data$streams)
    ggplot(data, aes(x = as.factor(danceability), y = streams)) +
      geom_boxplot(fill = "blue") +
      theme_minimal() +
      labs(title = "Distribution des Streams par Danceability (2023)", x = "Danceability", y = "Streams")
  })
  
  output$boxplotRankDanceability22 <- renderPlot({
    data <- spotify22_data() %>% slice(1:input$numSongs)
    data$danceability <- as.numeric(data$danceability)
    data$peak_rank <- as.numeric(data$peak_rank)
    ggplot(data, aes(x = as.factor(danceability), y = peak_rank)) +
      geom_boxplot(fill = "red") +
      theme_minimal() +
      labs(title = "Distribution des Classements par Danceability (2022)", x = "Danceability", y = "Classement maximal")
  })
}

