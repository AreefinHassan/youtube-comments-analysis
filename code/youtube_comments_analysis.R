# For more details on this exercise, see https://cran.r-project.org/web/packages/tuber/vignettes/tuber-ex.html. 
# For more information on the tuber package, see https://cran.r-project.org/web/packages/tuber/tuber.pdf 

# Install devtools package if not installed already
install.packages('devtools')
# Load devtools package
library(devtools)

# Using devtools to install tuber package from Github
devtools::install_github("soodoku/tuber")#, build_vignettes = TRUE)
# Load tuber package
library(tuber)

# Set working directory. 
# Data lives in data/ relative to this repo; no setwd() needed.
# Authenticate using your YouTube client ID and client secret key
## Then authenticate in browser
client_id="YOUR_CLIENT_ID.apps.googleusercontent.com" # Enter within double quotes your own client ID
client_secret="YOUR_CLIENT_SECRET"  # Enter within double quotes your own client secret key
yt_oauth(client_id, client_secret, token='')

###############################################################################################################
# Collect data on a Youtube video
###############################################################################################################

# Get statistics of a video with ID HhesaQXLuRY. The video ID is the string at the end of the youtube link: https://www.youtube.com/watch?v=9IIgH0hNtgk
get_stats(video_id="HhesaQXLuRY")

# Get details about the video
get_video_details(video_id="HhesaQXLuRY")

# Search Videos and save results in data frame called search_result
search_result <- yt_search("BREAKING BAD")
# Views the first three columns and the first few rows in results
View(search_result)

# Get comments on video and saves them to data frame called comments
comments <- get_comment_threads(c(video_id="HhesaQXLuRY"))
# View first few rows of comments
View(comments)

# Save comments to a csv file in working directory
write.csv(comments, file='YouTubeVideoComments.csv')

###########################################################################################################
# Create word cloud of the comments
###########################################################################################################

# Install tm, SnowballC and wordcloud packages for text preprocessing and word clods
install.packages('tm')
library(tm)
install.packages('SnowballC')
library(SnowballC)
install.packages('wordcloud')
library(wordcloud)


# Create comments corpus. Corpus is the set of all documnets we want to analyze
comments=data.frame(comments)
comments_corp=Corpus(VectorSource(comments$textOriginal))

# Text processing and create document-term matrix in which rows are documents/comments and coloums are the terms/words
# This function remove the puctuation, numbers and stopwords such as the, a , ...
comments_DTM=DocumentTermMatrix(comments_corp,control=list(removePunctuation=T,removeNumbers=T,stopwords=T))

# Displays first five terms in DTM
as.matrix(comments_DTM[,1:5])

# Create matrix of terms and frequency
comments_terms=colSums(as.matrix(comments_DTM))
comments_terms_matrix=as.matrix(comments_terms)
comments_terms_matrix

# Create word cloud of comments
wordcloud(words=names(comments_terms), freq=comments_terms, vfont=c('serif', 'bold italic'), colors=1:nrow(comments_terms_matrix))

# Create word cloud of comments
wordcloud(words=names(comments_terms), 
          freq=comments_terms, 
          scale=c(3, 0.5),  # Size scale for the words
          min.freq=2,  # Minimum frequency of words to be included
          max.words=200,  # Maximum number of words to be included
          random.order=FALSE,  # Display high-frequency words first
          rot.per=0.35,  # Proportion of words with 90-degree rotation
          colors=brewer.pal(8, "Dark2"))  # Color palette



install.packages('wordcloud2') 
library(wordcloud2) 

word_freq <- data.frame(word = names(comments_terms), freq = comments_terms)
wordcloud2(data = word_freq, 
           shape = 'diamond',  # You can use 'circle', 'cardioid', 'star', etc.
           color = 'random-light',  # Random light colors
           backgroundColor = "black")  # Background color
letterCloud( demoFreq, word = "R" , wordSize = 1, backgroundColor="black")

library(wordcloud2) 

# Create a Data Frame of Words and Their Frequencies
word_freq <- data.frame(word = names(comments_terms), freq = comments_terms)

# Create a Word Cloud with Breaking Bad Theme
wordcloud2(data = word_freq, 
           shape = 'diamond',  # You can change this to a custom shape if you have one
           color = "random-light",  # You might want to customize the colors to green and yellow
           backgroundColor = "black",  # Background color
           fontFamily = "Impact"  # Choose a font that matches the Breaking Bad theme
)







