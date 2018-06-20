a <- c("Sometimes", "Sometimes", "Never", "Always", "Always", "Sometimes", "Sometimes", "Never")
b <- c("Maybe", "Maybe", "Yes", "Maybe", "Maybe", "No", "Yes", "No")
t <- table(a, b)



a <- factor(c('A', 'A', 'B', 'A', 'B', 'B', 'C', 'A', 'C'))
t <- table(a)
attributes(t)
summary(t)


M <- matrix(c(4, 3, 2), ncol = 3, byrow = TRUE)
t <- as.table(M)
attributes(t)
mosaicplot(t)

M <- matrix(c(70, 120, 65, 140), ncol = 2, byrow = TRUE)
rownames(M) <- c("male", "female")
colnames(M) <- c("smoke", "nosmoke")
M <- as.table(M)

margin.table(M, margin = NULL)	# sum of table entries
#> margin = 1: by row; 2: by column; NULL: all
prop.table(M, margin = NULL)	# proportions of each entry 
