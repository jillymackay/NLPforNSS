# Packages You Need
library (tidyverse)
library (tidytext)
library (textstem)
library (wordcloud)
library (reshape2)
library (widyr)




# Our NSS Data usually comes in three columns: Positive, Negative and (if asked) a 'what one thing'
# You may also have data about what school or programme the student was on. 

# Read in your data

NSS.2016 <- NSS.2016 %>%
  mutate(College = case_when(School == "Biological Sciences" ~ "CSE",
                             School == "Biomedical Sciences" ~ "CMVM",
                             School == "Business School" ~ "CAHSS",
                             School == "Chemistry" ~ "CSE",
                             School == "Economics" ~ "CAHSS",
                             School == "Edinburgh College of Art" ~ "CAHSS",
                             School == "Edinburgh Medical School" ~ "CMVM",
                             School == "Engineering" ~ "CSE",
                             School == "Geosciences" ~ "CSE",
                             School == "Health in the Social Sciences" ~ "CAHSS",
                             School == "History, Classics and Archaeology" ~ "CAHSS",
                             School == "Informatics" ~ "CSE",
                             School == "Law" ~ "CAHSS",
                             School == "Literatures, Languages and Cultures" ~ "CAHSS",
                             School == "Mathematics" ~ "CSE",
                             School == "Moray House School of Education" ~ "CAHSS",
                             School == "Philosophy, Psychology and Language Studies" ~ "CAHSS",
                             School == "Physics and Astronomy" ~ "CSE",
                             School == "RDSVS" ~ "CMVM",
                             School == "Social and Political Science" ~ "CAHSS")) %>%
  gather(answer, comment, NEGATIVE:ONETHING, factor_key = TRUE) %>%
  filter (comment != "NA")
  
# For us, this process creates a college level variable from our schools
# It 'gathers' the data into tidy format, e.g. there is only one variable for the comments
# Each student may have up to three rows in this data 
# I don't feel the need to identify the individuals in this type of analysis

# Now we are going to break the data down into lemmas, or the most basic words used. 


free <- NSS.2016 %>%
  unnest_tokens(word, comment) %>%
  mutate (lemma = (lemmatize_strings(word))) %>%
  anti_join(stop_words) 


# From this we can ask how common these words are:
free %>%
  count(lemma, sort = TRUE)

# Or look by a grouping factor . . . 

free %>%
  group_by(College) %>%
  count(lemma, sort = TRUE)

# And there are pretty ways to visualise this
free %>%
  count(lemma) %>%
  with(wordcloud(lemma, n, max.words = 100, random.order = FALSE,  rot.per = 0))

# And we can visualise word frequency by groups:

free %>%
  mutate (Carer = case_when (Carer == "Not A Carer" ~ "Not Identified as a Carer",
                             Carer == "Not Sure" ~ "Not Identified as a Carer",
                             Carer == "Carer" ~ "Identified as a Carer")) %>%
  count (word, Carer, sort = TRUE) %>%
  acast (word ~ Carer, value.var = "n", fill = 0) %>%
  comparison.cloud (colors = c("#00325F", "#FF0000"), max.words = 100)

# What do students in CAHSS and CSE talk about positively?
free %>%
  filter (College != "CMVM") %>%
  filter (answer == "POSITIVE") %>%
  count (lemma, College, sort = TRUE) %>%
  acast (lemma ~ College, value.var = "n", fill = 0) %>%
  comparison.cloud (colors = c("#00325F", "#FF0000"), max.words = 50, rot.per = 0, title.size = 1.5, scale = c(5,0.5))




# However, we can see quite quickly that this is a pretty blunt measure of importance. 

# Let's instead look at what words crop up more often within a given grouping
# This is a term frequency - inverse document frequency

# Free text differences by school
comment_words <- free %>%
  count(answer, lemma, sort = TRUE) %>%
  ungroup()

total_words <- comment_words %>%
  group_by(answer) %>%
  summarize (total = sum(n))

comment_words <- left_join(comment_words, total_words)

comment_words <- comment_words %>%
  bind_tf_idf(lemma, answer, n)

comment_words %>%
  arrange(desc (tf_idf)) %>%
  mutate (lemma = factor (lemma, levels = rev(unique(lemma)))) %>%
  group_by (answer) %>%
  top_n(7, tf_idf) %>%
  ungroup() %>%
  ggplot(aes(lemma, tf_idf, fill = answer)) +
  geom_col(show.legend = FALSE) +
  labs (x = NULL, y = "Term Frequency - Inverse Document Frequency",
        title = "Term Frequency-Inverse Document Frequencies of Free Text Comments by Question") +
  facet_wrap(~answer, ncol = 3, scales = "free") +
  theme_classic() +
  coord_flip()



# What about relationships between words?

word_cors <- free %>%
  rename (CaseID = 'Case ID') %>%
  filter (answer == "NEGATIVE") %>%
  group_by(lemma) %>%
  filter(n() >= 20) %>%
  pairwise_cor(lemma, CaseID, sort = TRUE)



word_cors %>%
  filter (item1 %in% c("feedback", "assessment")) %>%
  group_by(item1) %>%
  top_n(8) %>%
  ungroup() %>%
  mutate(item2 = reorder(item2, correlation)) %>%
  ggplot(aes(item2, correlation, fill=item1)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ item1, scales = "free") +
  labs (title = "Correlations with given words across university in negative NSS free text comments", x = "Correlated Word") + 
  theme_classic () +
  coord_flip()
