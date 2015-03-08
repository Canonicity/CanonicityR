# CanonicityR
Assessing the Canonicity of Texts

## Introduction
CanonicityR is a text analysis package that compares any inputed text to texts from Harold Bloom's *The Western Canon*. Right now, the package only compares the texts along the lines of complexity and returns a similarity score.

## Installation
You can install the latest development version of CanonicityR from GitHub with
```
if (packageVersion("devtools") < 1.6) {
  install.packages("devtools")
}
devtools::install_github("Canonicity/CanonicityR")
```
## An Example
To use the CanonicityR package:
```
download.file("http://www.gutenberg.org/cache/epub/84/pg84.txt", "frankenstein.txt")
frankenstein <- scan("frankenstein.txt", what = "", skip = skip)
textComplexitySimilarity(frankenstein)
```

## Overview
The CanonicityR package is an extension of SUNY Geneseo's Canonicity Project. One of the project's chief goals is to determine what exactly makes a text canonical. One method for accomplishing that goal has been the development and implementation of quantitative methods of literary analysis in the vain of Matthew Jockers' work at the University of Nebraska and the work that the Stanford Literary Lab has published. The CanonicityR package was written under the assumption that the formal elements of literature should be the central focus of criticism.

The main function in CanonicityR is `textSimilarityComplexity`, which computes how complexly similar an inputed text is to texts included in Harold Bloom's *The Western Canon*. The complexity of texts are measured in three areas:
1. The ratio of unique words to total words in a text;
2. The ratio of the median length of words in characters to the median length of sentences in words;
3. The ratio of the frequency of semi-colons, colons, and dashes to the frequency of end punctuation.
Each text is considered in a three dimensional space defined by these three measures. It is from within this space that the distance between the median of Bloom's Canon and the inputed text is measured and returned to the user as a similarity score.