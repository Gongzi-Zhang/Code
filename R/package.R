# install package automatically
install.package("XML")
# install package manually: download the .zip package file
install.packages(file_name_with_path, repos = NULL, type = "source")
# e.g.
install.packages("~/R/XML_3.98-1.3-zip", repor = NULL, type = "source")

# Load package
library("package name", lib.loc = "path to library")

# verify package installation
any(grepl('package_name', installed.packages()))


### package dependency ###
"xlsx"	==> ubuntu package: "default-jre", "default-jdk"
"RCurl" ==> ubuntu package: "libcurl4-openssl-dev"
"XML"	==> ubunut package: "libxml2-dev"
"RMySQL"    ==> ubuntu package: "libmariadb-client-lgpl-dev"
