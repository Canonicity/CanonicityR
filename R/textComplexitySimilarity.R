#' textComplexitySimilarity
#' 
#' @author Sean Fischer and Ben Wach
#' @description This function compares the complexity of an inputed text to that of texts from Harold Bloom's the Western Canon
#' @param text What do you want to compare? Input your text as a character string
#' @return Numeric string giving the similarity of the inputed text to texts from Harold Bloom's The Western Canon
#' @keywords Western Canon, Complexity, Comparison
#' @export
#' @examples
#' textSimilarityComplexity()

textComplexitySimilarity <- function(text) {
  if(require("devtools")){
  } else {
    print("trying to install devtools")
    install.packages("devtools")
    if(require("devtools")){
      print("devtools installed and loaded")
      if(require("syuzhet")) {
      } else {
        print("trying to install syuzhet")
        devtools::install_github("mjockers/syuzhet")
        if(require("syuzhet")){
          print("syuzhet installed and loaded")
        } else {
          stop("could not install syuzhet")
        }
      }
    } else {
      stop("could not install devtools")
    }
  }
  if(require("stringi")) {
  } else {
    print("trying to install stringi")
    install.packages("stringi")
    if(require("stringi")) {
      print("stringi installed and loaded")
    } else {
      stop("could not install stringi")
    }
  }
  if (is.character(text) != TRUE) {
    stop("Your input is not a character string.")
  }
  text.lower <- tolower(text)
  text.words <- strsplit(text.lower, "\\W")
  text.words <- unlist(text.words)
  not.blanks <- which(text.words != "")
  text.words <- text.words[not.blanks]
  ratio <- length(unique(text.words))/length(text.words)
  words <- median(nchar(text.words))
  text.sentences <- get_sentences(text)
  lengths <- numeric(length(text.sentences))
  for(j in 1:length(text.sentences)) {
    stats <- stri_stats_latex(text.sentences[j])
    lengths[j] <- stats[4]
  }
  lengths <- median(lengths)
  sentences <- words/lengths
  semi <- length(grep(";", text))
  colon <- length(grep(":", text))
  comma <- length(grep(",", text))
  dash <- length(grep("-", text))
  total <- sum(semi, colon, comma, dash)
  numbSentences <- length(get_sentences(text))
  ratio2 <- total/numbSentences
  canon <- c(0.1394172, 0.1366637, 0.1398947)
  eucdist <- sqrt((ratio-canon[1])^2 + (sentences-canon[2])^2 + 
                    (ratio2-canon[3])^2)
  cat(eucdist)
}
