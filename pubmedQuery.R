library( RISmed )

query = "mri AND (lung OR pulmonary)"
res <- EUtilsSummary( query, db = "pubmed", retmax = 5000, mindate = '1990', maxdate = '2015' )
summary( res )
fetch <- EUtilsGet( res )
abstracts <- AbstractText( fetch )

# We count the occurrences of the two phrases (ignoring case):
#    "proton MRI"
#    "proton density weighted mri" OR "proton-density weighted mri" OR "proton density-weighted mri"

phrase1 <- "proton MRI"
phrase2 <- c( "proton density weighted mri", "proton-density weighted mri", "proton density-weighted mri" )

countPhrase1 <- 0
countPhrase2 <- 0

pb <- txtProgressBar( min = 0, max = length( abstracts ), initial = 0, char = "=",
  width = NA, title, label, style = 3, file = "" )

for( i in 1:length( abstracts ) )
  {
  setTxtProgressBar( pb, i )
  found <- grep( phrase1, abstracts[[i]], ignore.case = TRUE )
  if( length( found ) > 0 )
    {
    countPhrase1 <- countPhrase1 + 1
    }
  for( j in 1:length( phrase2 ) )
    {
    found <- grep( phrase2[j], abstracts[[i]], ignore.case = TRUE )
    if( length( found ) > 0 )
      {
      countPhrase2 <- countPhrase2 + 1
      break
      }
    }
  }
close( pb )

cat( "Number of times for phrase 1: ", countPhrase1, "\n" )
cat( "Number of times for phrase 2: ", countPhrase2, "\n" )
