"
                                Data Science Capstone

                                    Task 7

The goal of this exercise is to build and evaluate a predictive model. 
We will use the n-gram and backoff models. The goal is to make the model 
efficient and accurate. 
We will use three data sets comes from US twitter, US blogs and, Us news.

"

### Load libraries
library(dplyr, warn.conflicts = FALSE)
library(tm)
library(corpus)
library(shiny)
library(sbo)

### Set Working Directory
setwd('C:/Data-Science-Foundations-using-R-Specialization/Data-Science-Capstone/tasks/app')

#source('./task4.R')

### Set trigrams using R package "corpus"


## Prediction
p <- readRDS('./listApp.RDS')

p <- sbo_predictor(p)

## set app
shinyServer(function(input, output, session) {
                wd <- reactive({
                        inputWd <- input$word
                        inputWd
                })
                output$value <- renderTable({
                        sent <- wd()
                        x <- predict(p, sent)
                        df <- data.frame(as.integer(c(1, 2, 3)))
                        df[, 2] <- c(x[1], x[2], x[3])
                        names(df) <- c('Rank', 'Match')
                        df
                })       
                session$onSessionEnded(function() {
                        stopApp()
        })
}) 
