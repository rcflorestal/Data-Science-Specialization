library(shiny)

shinyUI(
        fluidPage(
                headerPanel(title = 'Type a word and wait'),
                textInput('word', '', ''),
                tableOutput('value'),
                tags$h3('Note'),
                tags$article('This output comes from the most frequent trigrams extracts from US Twitter, US blogs, and Us news, using natural language processing through R language.'),
                tags$h4('Read'),
                tags$a(href='https://github.com/rcflorestal/Data-Science-Specialization/tree/main/Data-Science-Capstone/Peer-Graded', 
                       'Read about it in the github repository')
        )
)   
