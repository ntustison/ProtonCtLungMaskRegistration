library( ggplot2 )
library( shiny )
library( ggvis )
library( rmarkdown )
library( revealjs )

buildRmd <- 'lobeEstimationBuild.Rmd'
rawRmds <- c( "lobeEstimation.Rmd" )

for ( x in 1:length( rawRmds ) )
  {
  cmd <- paste( "cat ", rawRmds[x], " >> ", buildRmd )
  if ( x == 1 )
    {
    cmd <- paste( "cat ", rawRmds[x], " > ", buildRmd )
    }
  system( cmd )
  }

render( buildRmd, clean = TRUE, "revealjs::revealjs_presentation", output_file = 'index.html' )
