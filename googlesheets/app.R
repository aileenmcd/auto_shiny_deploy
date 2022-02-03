library(shiny)
library(googlesheets4)

flood_counts <- read_sheet("1nGq6gK3FLIJ_gTlt1D1gOMFzJ6iellyrWBbwHBdKPMQ")


ui <- fluidPage(
  titlePanel("Count of flood warnings"),
  mainPanel(
    dataTableOutput("table")
  )
)


server <- function(input, output) {
  output$table <- renderDataTable(flood_counts)
}

shinyApp(ui = ui, server = server)
