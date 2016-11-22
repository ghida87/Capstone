load("ngram.RData")

library(stringr)
toWords <- function(ngram) str_split(ngram,pattern=boundary("word"))
toStr <- function(words) lapply(words,str_c,collapse=" ")

GetFinalNWords <- function(ngram,i){
  words <- toWords(ngram)
  toStr(lapply(words,function(s) { n<-length(s);  s[((n-i+1):n)] }))
  
}





Predict_Next <- function(Inputwords,final_bigrams_matrix,final_trigrams_matrix) {
  
  
  result <- NULL
  
  entry_length <- sapply(gregexpr("\\W+", Inputwords), length) + 1
  
  
  
  if (entry_length >= 2) {
    
    
    
    last_2_words <- GetFinalNWords(Inputwords,2)
    
    index <- which.max(final_trigrams_matrix[,1]==last_2_words)
    if (is.na(index)==FALSE) {
      return(as.character(final_trigrams_matrix[index,2]))
    }
    else {
      last_word <- GetFinalNWords(Inputwords,1)
       index <- which.max(final_bigrams_matrix[,1]==last_word)
       if (is.na(index)==FALSE){
         return(as.character(final_bigrams_matrix[index,2]))
       }
       else return(as.character("the"))
      
    }
    
    
  }
  

 
  
}
    
    
    
    
   