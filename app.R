library(shiny)
advertising <- read.csv("Advertising.csv")

ui <- fluidPage(
  selectInput(inputId = "channel",
              label = "Choose a factor to regress on Sales:",
              choices = c("TV", "Radio", "Newspaper"),
              selected = "TV"),
  plotOutput("scatter")
)

server <- function(input, output) {
  output$scatter <- renderPlot({
    factor = input$channel
    plot(advertising[, factor], advertising$Sales, xlab=factor, ylab="Sales", col="blue")
  })
}

shinyApp(ui = ui, server = server)