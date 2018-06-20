# example from wiki
# install.packages("caTools")
library(caTools)
jet.colors <- colorRampPalette(c("#00007F", "blue", "#00007F", "cyan", "#00007F",
				"yellow", "#00007F", "red", "#00007F"))
dx <- 400
dy <- 400
C <- complex( real=rep(seq(-2.2, 1.0, length.out=dx), each=dy ),
	      imag=rep(seq(-1.2, 1.2, length.out=dy), dx ) )
C <- matrix(C, dy, dx)	# reshape as square matrix of complex numbers
Z <- 0
X <- array(0, c(dy, dx, 20))	# initialize output 3D array
for (k in 1:20){
    Z <- Z^2 + C            # the central difference equation
    X[,,k] <- exp(-abs(Z))  # capture results
}
write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=900)
