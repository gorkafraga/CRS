# Load required packages
library(shiny)
library(DT)

# USER INTERFACE 
# ===============================================================

ui <- fluidPage(
  # Title 
  titlePanel("Exploring images from metadata table"), 
  # Panels
  sidebarLayout(
    # Button to update the table and upload file
    sidebarPanel(
      fileInput("uploadFile", "Upload CSV File"),
      actionButton("refreshButton", "Refresh table")
    ), 
    # Panel displaying the table
    mainPanel(
      DTOutput("data_table", width = "100%")
    )
  )
)


# SERVER 
# ===============================================================

# Define server logic
server <- function(input, output, session) {
  
  # Create a 'reactiveValues' object to hold the data
  data <- reactiveValues(table_data = NULL)
  
  # Function to read data from CSV file
  read_data <- function(file) {
    tryCatch({
      if (!is.null(file)) {
        data$table_data <- read.csv(file$datapath)
      } else {
        data$table_data <- read.csv('Metadata_filenames_html.csv')
      }
    }, error = function(e) {
      cat("Error reading CSV file:", conditionMessage(e), "\n")
    })
  } 
  
  # Initial data read
  read_data(NULL)
  
  # Observe the file upload
  observeEvent(input$uploadFile, {
    read_data(input$uploadFile)
  })
  
  # Observe the refresh button click
  observeEvent(input$refreshButton, {
    read_data(NULL)
  })
  
  # Render the data table
  output$data_table <- DT::renderDataTable({
    datatable(
      data$table_data,
      escape = FALSE,
      filter = "top",
      rownames = FALSE, 
      width = "100%",
      extensions = c('Buttons', 'Select'),
      selection = 'none',
      options = list(dom = 'Bfrtip', buttons = c('copy', 'csv', 'excel', 'pdf'))
    )
  })
}

# Run the Shiny app
shinyApp(ui, server)
