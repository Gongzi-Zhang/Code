# usage about R interpreter
help(source)
source('file.R')

## ls: available variables
ls()
ls(pattern = "var") # variables starting with the pattern "var"
ls(all.name = TRUE) # list hidden variable(start with dot)

help(environment)
e <- environment()  # current R Global Environment
assign("bubba", 3, e)
ls()	# "bubba" "e"
get("bubba", e)	# 3

rm(var)	# rm a variable
attr

getwd()	# get current working dir.
setwd()	# set current working dir.

## options
help(options)	# learn about available options
options()   # view current option settings
options(digits=3)   # number of digits to print on output

## history
history()   # show last 25 commands
history(max.show=Inf) # show all previous commands
savehistory(file='history')	# default: ".Rhistory"
save.image()	# save the workspace to the file .RData in the cwd
save(object_list, file="file.RData")	# save specific objects to a file;if you don't specify the path, it is stored in the cwd.
load("file.RData")  # load a workspace into the current session.

## package management
help(pacakge = "ggplot2")
.libPaths() # Get library locations containing R packages
library()   # get the list of all the packages installed
installed.packages()	# list all installed packages
search()    # get all packages currently loaded in the R environment
update.packages()   # check update of packages
install.packages("package name")    # install package directly from CRAN
install.packages("XML")
install.packages(file_name_with_path, repos = NULL, type = "source")	
install.packages("~/R/library/XML_3.98-1.3.zip", repos = NULL, type = "source")	
# install a r package from local dir. by browsing and selecting the file
install.packages(file.choose(), repos = NULL)	
# install downloaded package(.zip file) manually 
library("package name", lib.loc = "path to library")	# load a package
data(package = "MASS")	# list the data sets available in package "MASS"
# list all data sets available in all available packages
data(package = .packages(all.available = TRUE))	


# device
dev.new()
dev.new()   # create new device
dev.cur()   # current active device
dev.list()  # list available device
dev.set(3)  # set device to draw
dev.next()
dev.print(device = png, width=200, "hist.png")	# save to a file
dev.off()   # save device content
dev.copy(driver, 'file name')
#> driver can be any one of the following: png, jpeg, pdf, postscript, win.metafile
