# Load required packages
library(shiny)
library(DT)
library(readr)
library(shinyscreenshot)

# Set URL for default file
fileinput <- "https://raw.githubusercontent.com/gorkafraga/CRS/main/utilities/ShinyApps/Shiny_AFFORD_image_explorer/Metadata_filenames.csv"

Sys.setenv("VROOM_CONNECTION_SIZE" = 131072 * 2)




# USER INTERFACE 
# ===============================================================
ui <- fluidPage(
  
  # Title 
  titlePanel("Image explorer"), 
  br(),
  p('The default metadata table was read from:'),
  p(fileinput),
  
  # Panels
  sidebarLayout(
    sidebarPanel(
      width = 2, 
      # Button to snapshot 
      p('Take a snapshot of entire image. NOTE: does not work with Internet Explorer'),
      actionButton("screenshot1", "Take a snapshot"),
      p(),
      br(),
      
      # Buttons to upload a table (uncomment if you want this feature)
      #fileInput("uploadFile", "Upload CSV File"), 
      
      # Buttons to Refresh 
      strong('Refresh the table if source may have changed'), 
      br(),
      actionButton("refreshButton", "RefreshTable"),
      p(), # adding some empty space 
      br(),
      
      # Dropdown menu for filtering specID 
      selectizeInput("filterSpecID", "Filter specID:", choices = NULL, multiple = TRUE, options = list(placeholder = 'Select specID...')),
      
      # Dropdown menu for filtering scanID
      selectizeInput("filterScanID", "Filter scanID:", choices = NULL, multiple = TRUE, options = list(placeholder = 'Select scanID...')),
      
      # Checkbox menu for filtering status
      checkboxGroupInput("filterStatus", "Filter status:", choices = NULL)
    ), 
    # Panel displaying the table
    mainPanel(
      width = 10,
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
  read_data <- function(file = NULL) {
    tryCatch({
      if (!is.null(file)) {
        data$table_data <- read_csv(file$datapath, show_col_types = FALSE)
      } else {
        data$table_data <- read_csv(fileinput, show_col_types = FALSE)
      }
    }, error = function(e) {
      cat("Error reading CSV file:", conditionMessage(e), "\n")
    })
  } 
  
  # Initial data read
  read_data()
  
  
  # Observe user inputs ---------------------------------------------------
  #screenshot
  observeEvent(input$screenshot1, {
    screenshot()
  })
  
  # Observe the file upload (if SIDE Panel still contains this option)
  observeEvent(input$uploadFile, {
    read_data(input$uploadFile)
  })
  
  # Observe the refresh button click
  observeEvent(input$refreshButton, {
    read_data()
  })
  
  # Update the choices for filterSpecID dropdown
  observe({
    if (!is.null(data$table_data)) {
      updateSelectizeInput(session, "filterSpecID", choices = unique(data$table_data$specID), selected = input$filterSpecID)
      updateCheckboxGroupInput(session, "filterStatus", choices = unique(data$table_data$status), selected = input$filterStatus)
    }
  })
  
  # Update the choices for filterScanID dropdown
  observe({
    if (!is.null(data$table_data)) {
      updateSelectizeInput(session, "filterScanID", choices = unique(data$table_data$scanID), selected = input$filterScanID)
      updateCheckboxGroupInput(session, "filterStatus", choices = unique(data$table_data$status), selected = input$filterStatus)
    }
  })
  
  # Generate Output --------------------------------------------
  
  output$data_table <- DT::renderDataTable({
    
    filtered_data <- data$table_data
    # Filter according to inputs 
    if (!is.null(input$filterSpecID) && length(input$filterSpecID) > 0) {
      filtered_data <- filtered_data[filtered_data$specID %in% input$filterSpecID, ]
    }
    if (!is.null(input$filterScanID) && length(input$filterScanID) > 0) {
      filtered_data <- filtered_data[filtered_data$scanID %in% input$filterScanID, ]
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
      extensions = c('Buttons','Responsive','KeyTable'),
      selection = 'none',
      options=list(
        keys=TRUE,
        dom='Brftip', 
        buttons=c('copy','csv','excel','pdf'),
        pageLength=20
      )
    )
  })
}

# Run the Shiny app
shinyApp(ui, server)
