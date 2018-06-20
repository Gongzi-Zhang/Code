#!/bin/bash

##########################################################################
# for unknown reasons, dot can't produce multi-plots in single pdf file
# here is an ugly walk-around to split the pdf output from dot into 
# separate pdf files and then concatenate them again.
##########################################################################

# split multiple pages into seperated pdf files (prefixed with tmpfile)
dot -Tpdf graph.dot | csplit --quiet --elide-empty-files --prefix=tmpfile - "/%%EOF/+1" "{*}"
'
1. dot writes all the separate pdf files in one single output
2. pipe the output to csplit and split it to separate files, using the %%EOF token
'
pdftk tmpfile* cat output grpah.pdf && rm -r tmpfile*
'
3. using pdftk to concatenate the pdf files into one
4. rm tmp files.
'

