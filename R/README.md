# 

# help
help(package)
help.search(package)
?key-word
??key-word

## reserved words
    ?reserved	| help(reserved)

    if		else    repeat  while   function
    for		in	next    break   TRUE
    FALSE	NULL	Inf	NaN	NA
    NA_integer_	NA_real	NA_complex_	NA_character_	


## package
* Installing R packages from CRAN(Comprehensive R Archive Network)
in R:
    >install.packages("somepackage")
# but R package install can only be utilized by the user who install
# it. To make it available generally, use command:
$ sudo su - -c "R -e \"install.packeges('shiny', repos='http://cran.rstudio.com/')\""

# Loading it to verify successful installation:
    >library(shiny)

# to install packages not in cran, but in github, we need to use devtools R package
			devtools 
	             /      |     \
	            /       |      \
	           /        |       \
   libcurl4-gnutls-dev libxml2-dev  libssl-devc
# now we can install package from githup use command install_github() from devtools, Github package is defined by its author and its name.
$  sudo su - -c "R -e \"devtools::install_github('daattali/shinyjs')\""

# Running
$  Rscript script.R

# Scripting
## comments
    R doesn't support multi-line comments, but we can perform a trick
    which is:
    if(FALSE) {
	"Comments goes here"
	}

## R-object
    no-type-declaration variable:
    The variables are assigned with R-Objects and the data type of the
    R-Object becomes the data type of the variable. The frequently used
    R-objects are (**structure**):
    * Vectors
    * Lists
    * Matrices (2D vector)
    * Arrays   (Multi-Dim vector)
    * Factors
    * Data Frames
    * Table
    There are 6 data-types (class) of these R-objects:
    Data Type	    Example
    Logical	    TRUE, FALSE
    Numeric	    12.3, 5, 999
    Integer	    2L, 34L, 0L
    Complex	    3+2i
    Character	    'a', "good", "TRUE", '23.4'
    Raw		    "Hello" is stored as 48 65 6c 6c 6f, for **Raw** data type, char is firstly translate into integer.
