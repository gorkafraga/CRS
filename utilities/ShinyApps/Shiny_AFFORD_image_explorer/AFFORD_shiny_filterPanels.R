# Load required packages
library(shiny)
library(DT)
library(readr) 

# Set URL for default file
fileinput <- "https://raw.githubusercontent.com/gorkafraga/CRS/main/utilities/ShinyApps/Shiny_AFFORD_image_explorer/Metadata_filenames.csv"
Sys.setenv("VROOM_CONNECTION_SIZE" = 131072 * 2) # this fixes a problem reading url above

# USER INTERFACE 
# ===============================================================
ui <- fluidPage(
  
  # Title 
  titlePanel("Image explorer"), 
  # short text 
  br(),
  p('The default metadata table was read from:'),
  p(fileinput),
  
  # Panels
  sidebarLayout(
    # Refresh button on the side
    sidebarPanel(
      width = 2,  
      actionButton("refreshButton", "RefreshTable"),
    ), 
    # Main panel displaying the table
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
      
      metadata <- read_csv(file, show_col_types = FALSE)
      metadata$pic <- paste0('<a href=\'',metadata$file ,'\' target=\'_blank\'>',
                               '<img src=\'', metadata$file, '\' height=\'70\',
                               ,\'/></a>')
      data$table_data <- metadata
    }
        
  # Initial data read
  read_data(fileinput)
  
  # Observe user inputs ---------------------------------------------------

  # Observe the refresh button click
  observeEvent(input$refreshButton, {
    read_data(fileinput)
  })
  
 
  # Generate Output --------------------------------------------
  
  output$data_table <- DT::renderDataTable({
    # render the table
    datatable(
      data$table_data,
      escape = FALSE,
      filter = "top",
      rownames = FALSE, 
      width = "100%",
      extensions = c('Buttons','Responsive'),
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
