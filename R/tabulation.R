# visulize data in table
# basic
util::edit(x)
util::View(x)
#> x is a table or data.frame

# gridExtra 
library(gridExtra)
grid.table(x)
d <- head(iris[,1:3])
grid.table(d)

colnames(d) <- c("alpha*integral(xdx, a, infinity)",
		 "this text \n is high", "alpha/beta")

## use 'parse' option to show math notation
tt <- ttheme_default(colhead=list(fg_params = list(parse=TRUE)))    
grid.table(d, theme=tt)

## aesthetic formatting: ttheme
tt1 <- ttheme_default()
tt2 <- ttheme_minimal()
tt3 <- ttheme_minimal(core=list(bg_params = list(fill = blue9[1:4], col = NA),
				fg_params = list(fontface = 3)),
		      colhead = list(fg_params = list(col="navyblue", fontface = 4L)),
		      rowhead = list(fg_params = list(col="orange", fontface = 3L)))
grid.arrange(tableGrob(iris[1:4, 1:2], theme=tt1),
	     tableGrob(iris[1:4, 1:2], theme=tt2),
	     tableGrob(iris[1:4, 1:2], theme=tt3),
	     nrow=1)

# if the formatting values are fewer than the number of cells, they are
# recycled along columns
t1 <- ttheme_default(core=list(fg_params=list(fontface=c(rep("plain", 4), "bold.italic")),
			       bg_params=list(fill=c(rep("grey95", "grey90"),
						     length.out=4, "#6BAED6"),
					      alpha = rep(c(1, 0.5), each = 5))
			       ))
grid.table(iris[1:5, 1:3], theme = t1)

### text justification
tt1 <- ttheme_default()
tt2 <- ttheme_default(core=list(fg_params=list(hjust=1, x=0.9)),
		      rowhead=list(fg_params=list(hjust=1, x=0.95)))
tt3 <- ttheme_default(core=list(fg_params=list(hjust=0, x=0.1)),
		      rowhead=list(fg_params=list(hjust=0, x=0)))
grid.arrange(tableGrob(mtcars[1:4, 1:2], theme=tt1),
	     tableGrob(mtcars[1:4, 1:2], theme=tt2),
	     tableGrob(mtcars[1:4, 1:2], theme=tt3),
	     nrow = 1)

### adjust width
g <- g2 <- tableGrob(iris[1:4, 1:3], cols = NULL, rows = NULL)
g2$widths <- unit(rep(1/ncol(g2), ncol(g2)), "npc")
grid.arrange(rectGrob(), rectGrob(), nrow = 1)
grid.arrange(g, g2, nrow = 1, newpage = FALSE)

### alignment of several tables
d1 <- PlantGrowth[1:3, 1, drop=FALSE]
d2 <- PlantGrowth[1:2, 1:2]

g1 <- tableGrob(d1)
g2 <- tableGrob(d2)

halighned <- combine(g1, g2, along = 1)
valighned <- combine(g1, g2, along = 2)
grid.newpage()
grid.arrange(halighned, valighned, ncol=2)

### Borders and separators
library(gtable)
g <- tableGrob(iris[1:4, 1:3], rows = NULL)
g <- gtable_add_grob(g, grobs = rectGrob(gp = gpar(fill = NA, lwd = 2)),
		     t = 2, b = nrow(g), l = 1, r = ncol(g))
g <- gtable_add_grob(g, grobs = rectGrob(gp = gpar(fill = NA, lwd = 2)),
		     t = 1, l = 1, r = ncol(g))
grid.draw(g)

#### add lines: segmentsGrob, the default value for segmentsGrob are:
#### x0 = 0, y0 = 0, x1 = 1, y1 = 1, all in npc, relative to the cells
g <- tableGrob(iris[1:4, 1:3])
g <- gtable_add_grob(g, grobs = grobTree(
			    segmentsGrob(
				x0 = unit(0, "npc"),
				y0 = unit(1, "npc"),
				x1 = unit(1, "npc"),
				y1 = unit(0, "npc"),
				gp = gpar(lwd = 2.0)),
			    segmentsGrob(
				x0 = unit(0, "npc"),
				y0 = unit(0, "npc"),
				x1 = unit(1, "npc"),
				y1 = unit(1, "npc"),
				gp = gpar(lwd = 2.0))),
			     t = 3, b = 3, l = 3, r = 3)
grid.draw(g)

#### if you have many cells to decorate you can use 'replicate' to create the
#### segments.
g <- tableGrob(head(iris), theme = ttheme_minimal())
separators <- replicate(ncol(g) - 2,
			segmentsGrob(x1 = unit(0, "npc"), gp = gpar(lty = 2)), simplify = FALSE)
g <- gtable::gtable_add_grob(g, grobs = separators, 
			     t = 2, b = nrow(g), l = seq_len(ncol(g)-2) + 2)
grid.draw(g)

### accessing existing grobs in the table
g <- tableGrob(iris[1:4, 1:3])
find_cell <- function(table, row, col, name = "core-fg"){
    l <- table$layout
    which(l$t==row & l$l == col & l$name == name)
}

ind <- find_cell(g, 3, 2, "core-fg")
ind2 <- find_cell(g, 2, 3, "core-fg")
g$grobs[ind][[1]][["gp"]] <- gpar(fontsize = 15, fontface="bold")
g$grobs[ind2][[1]][["gp"]] <- gpar(fill="darkolivegreen1", col = "darkolivegreen4", lwd = 5)
grid.draw(g)
