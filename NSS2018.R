library (tidyverse)
library (tidytext)
library (textstem)
library (wordcloud)
library (reshape2)
library (widyr)
library(readxl)


# I download all the free text comments from 2018 into a folder in my working directory
# Except ECN, ENG and LAW which need column adjustment
# The following function reads all of those files at once, but doesn't create multiple data objects

read.multiple <- function() {
  file.list <- list.files (pattern = '*.xlsx',  recursive = TRUE)
  df.list <- lapply (file.list, read_excel)
  bind_rows(df.list)
}

lazytf <- function (data, word = "word", grouping_factor) {
  qgv <- enquo (grouping_factor)
  word <- enquo (word)
  data %>%
    group_by(!!qgv) %>%
    count (!!qgv, !!word, sort = TRUE) %>%
    ungroup() %>%
    mutate (total = sum(n)) %>%
    bind_tf_idf (., !!word, !!qgv, n)
  
}
# this command is for some reasonr eading in bio multiple times

NSS.2018 <- read.multiple() %>%
  mutate (CaseID = row_number()) %>%
  rename (School = 'NSS 2018 - Free text comments',
          Negative = 'X__1',
          Positive = 'X__2') %>%
  mutate(School = ifelse(is.na(School), School2, School)) %>%
  filter (str_detect(School, "Student") ==  FALSE,
          School != "School") %>%
  mutate(College = case_when(School == "BIO" ~ "CSE",
                             School == "BMS" ~ "CMVM",
                             School == "BUS" ~ "CAHSS",
                             School == "CHE" ~ "CSE",
                             School == "DIV" ~ "CAHSS",
                             School == "ECN" ~ "CAHSS",
                             School == "ECA" ~ "CAHSS",
                             School == "MED" ~ "CMVM",
                             School == "ENG" ~ "CSE",
                             School == "GEO" ~ "CSE",
                             School == "HEA" ~ "CAHSS",
                             School == "HCA" ~ "CAHSS",
                             School == "INF" ~ "CSE",
                             School == "LAW" ~ "CAHSS",
                             School == "LLC" ~ "CAHSS",
                             School == "MAT" ~ "CSE",
                             School == "EDU" ~ "CAHSS",
                             School == "PPL" ~ "CAHSS",
                             School == "PHY" ~ "CSE",
                             School == "VET" ~ "CMVM",
                             School == "SPS" ~ "CAHSS")) %>%
  gather(answer, comment, Negative:Positive, factor_key = TRUE) %>%
  filter (!is.na(comment)) %>%
  unnest_tokens(word, comment) %>%
  mutate (lemma = (lemmatize_strings(word))) %>%
  anti_join(stop_words)


# Are schools doing something uniquely well?
positivecomments <- NSS.2018 %>%
  filter (answer == "Positive")

comment_pos<- lazytf(positivecomments, lemma, School)

comment_pos %>%
  arrange(desc (tf_idf)) %>%
  mutate (lemma = factor (lemma, levels = rev(unique(lemma)))) %>%
  group_by (School) %>%
  top_n(5, tf_idf) %>%
  ungroup() %>%
  ggplot(aes(lemma, tf_idf, fill = School)) +
  geom_col(show.legend = FALSE) +
  labs (x = NULL, y = "Term Frequency - Inverse Document Frequency",
        title = "Term Frequency-Inverse Document Frequencies of Positive Free Text  Comments by School") +
  facet_wrap(~School, ncol = 4, scales = "free") +
  theme_classic() +
  coord_flip()


# Are schools doing something uniquely poorly?
negativecomments <- NSS.2018 %>%
  filter (answer == "Negative")

comment_neg<- lazytf(negativecomments, lemma, School)

comment_neg %>%
  arrange(desc (tf_idf)) %>%
  mutate (lemma = factor (lemma, levels = rev(unique(lemma)))) %>%
  group_by (School) %>%
  top_n(5, tf_idf) %>%
  ungroup() %>%
  ggplot(aes(lemma, tf_idf, fill = School)) +
  geom_col(show.legend = FALSE) +
  labs (x = NULL, y = "Term Frequency - Inverse Document Frequency",
        title = "Term Frequency-Inverse Document Frequencies of Negative Free Text  Comments by School") +
  facet_wrap(~School, ncol = 4, scales = "free") +
  theme_classic() +
  coord_flip()





# What about relationships between words?

word_cors <- NSS.2018 %>%
  filter (answer == "Negative") %>%
  group_by(lemma) %>%
  filter(n() >= 20) %>%
  pairwise_cor(lemma, CaseID, sort = TRUE)



word_cors %>%
  filter (item1 %in% c("strike")) %>%
  group_by(item1) %>%
  top_n(5) %>%
  ungroup() %>%
  mutate(item2 = reorder(item2, correlation)) %>%
  ggplot(aes(item2, correlation, fill=item1)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~ item1, scales = "free") +
  labs (title = "Correlations with given words across university in negative NSS free text comments", x = "Correlated Word") + 
  theme_classic () +
  coord_flip()
