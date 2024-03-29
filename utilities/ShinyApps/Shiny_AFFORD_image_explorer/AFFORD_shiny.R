# Load required packages
library(shiny)
library(DT)

fileiput <- 'Metadata_filenames_html.csv'

https://github.com/gorkafraga/CRS/blob/main/utilities/ShinyApps/Shiny_AFFORD_image_explorer/AFFORD_shiny.R

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
      actionButton("refreshButton", "Refresh table"),
      
      # Dropdown menu for filtering specID
      selectizeInput("filterSpecID", "Filter specID:", choices = NULL, multiple = TRUE, options = list(placeholder = 'Select specID...')),
      
      # Dropdown menu for filtering scanID
      selectizeInput("filterSpecID", "Filter scanID:", choices = NULL, multiple = TRUE, options = list(placeholder = 'Select scanID...')),
      
      # Checkbox menu for filtering status
      checkboxGroupInput("filterStatus", "Filter status:", choices = NULL)
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
        data$table_data <- read.csv(fileiput)
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
  
  # Update the choices for filterSpecID dropdown
  observe({
    if (!is.null(data$table_data)) {
      updateSelectizeInput(session, "filterSpecID", choices = unique(data$table_data$specID), selected = input$filterSpecID)
      updateCheckboxGroupInput(session, "filterStatus", choices = unique(data$table_data$status), selected = input$filterStatus)
    }
  })
  
  # Interactive table
  output$data_table <- DT::renderDataTable({
    filtered_data <- data$table_data
    
    # Check inputs in side panel 
    if (!is.null(input$filterSpecID) && length(input$filterSpecID) > 0) {
      filtered_data <- filtered_data[filtered_data$specID %in% input$filterSpecID, ]
    }
    if (!is.null(input$filterScanID) && length(input$filterScanID) > 0) {
      filtered_data <- filtered_data[filtered_data$filterScanID %in% input$filterScanID, ]
    }
    if (!is.null(input$filterStatus) && length(input$filterStatus) > 0) {
      filtered_data <- filtered_data[filtered_data$status %in% input$filterStatus, ]
    }
    
    # render the table
    datatable(
      filtered_data,
      escape = FALSE,
      filter = "top",
      rownames = FALSE, 
      width = "100%",
      extensions = c('Buttons'),
      selection = 'none',
      options=list(
        dom='Ptip', 
        buttons=c('copy','csv','excel','pdf'),
        pageLength=20
      )
    )
  })
}

# Run the Shiny app
shinyApp(ui, server)
