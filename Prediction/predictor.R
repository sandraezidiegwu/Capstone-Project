# ---
# title: 'Data Science Capstone: Predictive Text Analysis'
# author: "Sandra Ezidiegwu"
# date: "September 29, 2016"
# output: html_document
# ---

library(R.utils)
library(stringi)
library(splitstackshape)
library(dplyr)
library(tidyr)
library(ggplot2)
library(ngram)
library(tm)
library(tau)

load(file = "./finalbigram.RData")
load(file = "./finaltrigram.RData")
load(file = "./finalquadgram.RData")

nextwordpred <- function(textInput) {
  
  textInput <- tolower(textInput)
  textInput <- separate(data.frame(textInput),
                        col = textInput, sep = " ", 
                        into = paste("C", 1:stri_count(textInput, regex = "\\S+"), sep = "."))
  
  if (length(textInput) >= 3) {
    
    textInput <- textInput[(length(textInput)-2):length(textInput)]
    
    wordPred <- as.character(finalquadgram[finalquadgram$unigram %in% textInput[1] & 
                                             finalquadgram$bigram %in% textInput[2] & 
                                             finalquadgram$trigram %in% textInput[3],][1,]$quadgram)
    
    if(is.na(wordPred)) {
      wordPred <- as.character(finaltrigram[finaltrigram$unigram %in% textInput[2] & 
                                              finaltrigram$bigram %in% textInput[3],][1,]$trigram)
      
      if(is.na(wordPred)) {
        wordPred <- as.character(finalbigram[finalbigram$unigram %in% textInput[3],][1,]$bigram)
        
        if(is.na(wordPred)) {
          wordPred <- "Next word not found in prediction library."
        }
      }
    }
  }
  
  else if (length(textInput) == 2) {
    
    wordPred <- as.character(finalquadgram[finalquadgram$unigram %in% textInput[1] & 
                                             finalquadgram$bigram %in% textInput[2],][1,]$trigram) 
    
    if(is.na(wordPred)) { 
      
      wordPred <- as.character(finalquadgram[finalquadgram$bigram %in% textInput[1] & 
                                               finalquadgram$trigram %in% textInput[2],][1,]$quadgram) 
      
      if(is.na(wordPred)) { 
        
        wordPred <- as.character(finaltrigram[finaltrigram$unigram %in% textInput[1] & 
                                                finaltrigram$bigram %in% textInput[2],][1,]$trigram)
        
        if(is.na(wordPred)) {
          wordPred <- as.character(finalbigram[finalbigram$unigram %in% textInput[2],][1,]$bigram)
          
          if(is.na(wordPred)) {
            wordPred <- "Next word not found in prediction library."
          }
        }
      }
    }
  }
  
  else {
    
    wordPred <- as.character(finalbigram[finalbigram$unigram %in% textInput,][1,]$bigram)
    
    if(is.na(wordPred)) { 
      
      wordPred <- as.character(finaltrigram[finaltrigram$bigram %in% textInput,][1,]$trigram)
      
      if(is.na(wordPred)) {
        wordPred <- as.character(finaltrigram[finaltrigram$unigram %in% textInput,][1,]$bigram) 
        
        if(is.na(wordPred)) {
          wordPred <- "Next word not found in prediction library."
        }
      }
    }
  }
  print(wordPred)
}
