if (interactive()) {
        
        ui <- fluidPage(
                headerPanel(title = 'Type a word and wait'),
                textInput('word', '', 'piece'),
                verbatimTextOutput('value'),
                tags$h3('Note'),
                tags$article('This output comes from the most frequent trigrams extracts from US Twitter, US blogs, and Us news, using natural language processing through R language.'),
                tags$h4('Read'),
                tags$a(href='https://github.com/rcflorestal/Data-Science-Specialization/tree/main/Data-Science-Capstone/Peer-Graded', 
                       'Read about it in the github repository')
        )
        
        
        server <- function(input, output) {
                answerApp <- function(txt) {
                        getWord <- stringr::word(txt)
                        NextWord <- grep(paste0('^', getWord), trigrams[, 1], value = TRUE)
                        paste(head(NextWord, 4), collapse = ', ')
                }
                output$value <- renderText({ answerApp(input$word) })
        }
        shinyApp(ui, server)
}
