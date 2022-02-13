library(shiny)
library(DT)

rm(list=ls())

# test

sample_table = readRDS("/srv/shiny-server/test_repo_R_local/local storage/sample_table.rds")

ui = fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "input_name",
        "Select name",
        choices = c("Beavus","Butthead","Mitica","Zoltan","Remote boy")
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










