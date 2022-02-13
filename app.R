library(shiny)
library(DT)

rm(list=ls())

# test

sample_table = readRDS("/R_work/test_repo_R_local/local storage/sample_table.rds")
# sample_table = data.frame(col1 = as.character(c("one","two","three","four","this is a loaded RDS table")),
#                          col2 = as.numeric(c(1,2,3,4,5)))
  
ui = fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "input_name",
        "Select name",
        choices = c("Beavus","Butthead","Mitica","Zoltan")
      )
    ),
    mainPanel(
      textOutput(
        "output_name"
      ),
      DT::DTOutput("output_sample_table")
    )
  )
)

server = function(input,output,session){
  output$output_name = renderText(paste0("Hello ",input$input_name,"!"))
  output$output_sample_table = renderDT({
    tableData = sample_table
    datatable(tableData)
  })
}

shinyApp(ui = ui, server = server)










