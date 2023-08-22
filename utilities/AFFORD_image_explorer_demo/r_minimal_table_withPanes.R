


# Read source table # 
output_table_panes <-  
  datatable(
    metadata, filter = "top",
    rownames=FALSE, width="100%", 
    class='compact cell-border hover', # CSS classes https://datatables.net/manual/styling/classes
    extensions=c('Buttons','Select','SearchPanes'),
    #selection = 'none',
    selection = 1,
    escape = FALSE,
    options = list(dom = 'PBfrtip', buttons=c('copy','csv','excel','pdf'),
                   columnDefs = list(list(
                     searchPanes = list(show = TRUE), 
                     targets = 5
                   ))),
  )

# Save the HTML output to a file
library(htmltools)
htmltools::save_html(output_table, "output_table_panes.html",)
    