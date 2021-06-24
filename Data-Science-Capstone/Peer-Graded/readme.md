## Peer-graded Assignment Overview
The goal of this project is to carry out an exploratory analysis in three data sets comes from US Twitter, 
US blogs and, Us news to create a prediction algorithm. We applied regex expressions to cleaning the data sets, which included: 
i) Remove non-English characters; ii) Convert all words to lowercase; iii) Removing punctuation, numbers, special characters, and excessive white spaces.
We also applied some text processing to i) remove stop words; ii) Stemming the text and, iii) Remove URLs. This task was carried on by the R package "sentimentr" [1].
In the next step, we will develop an app using the R package "shiny" [4].

## Summary Data sets

<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/tasks/out/tab_1_summary.png">
</p>

## Data Samplig
As it turns out in the table above, the data sets are very larges and require a long time to read and process, which made us adopt a sampling of 20% of the each data set.

## Lexical analysis
Lexical analysis was performed using R packages sentimentr [1], tidytext [2] and, wordcloud [3]. The figures below show the most frequently used words, most frequent profanity words, most frequent bigrams and trigrams, most positive and negative words on US Twitter, US blogs, and US news.

### Most frequent words on US Twitter
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/WordCloud_US_Twitter200.png">
</p>

### Most frequent words on US Blogs
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/WordCloud_US_Blog200.png">
</p>

### Most frequent words on US News
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/WordCloud_US_News200.png">
</p>

### Most frequent profanity words
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/profanityWords.png">
</p>

### Most frequent bigrams
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/bigrams.png">
</p>

### Most frequent trigrams
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/trigrams.png">
</p>

### Most positive and negative words on Twitter
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/Posite-and-Negative-Words-Twitter2.png">
</p>

### Most positive and negative words on US blogs
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/Posite-and-Negative-Words-Blogs2.png">
</p>

### Most positive and negative words on US News
<p align="center">
  <img src="https://github.com/rcflorestal/Data-Science-Specialization/blob/main/Data-Science-Capstone/Peer-Graded/output/Posite-and-Negative-Words-News_2.png">
</p>

## References
[1] Rinker, T. W. (2019). sentimentr: Calculate Text Polarity Sentiment. version 2.7.1. http://github.com/trinker/sentimentr

[2] Silge J, Robinson D (2016). “tidytext: Text Mining and Analysis Using Tidy Data Principles in R.” _JOSS_, *1*(3). doi: 10.21105/joss.00037 (URL: https://doi.org/10.21105/joss.00037), <URL: http://dx.doi.org/10.21105/joss.00037>.

[3] Ian Fellows (2018). wordcloud: Word Clouds. R package version 2.6. https://CRAN.R-project.org/package=wordcloud

[4] Winston Chang, Joe Cheng, JJ Allaire, Carson Sievert, Barret Schloerke, Yihui Xie, Jeff Allen, Jonathan McPherson, Alan Dipert and Barbara Borges (2021). shiny: Web Application Framework for R. R package version 1.6.0. https://CRAN.R-project.org/package=shiny
