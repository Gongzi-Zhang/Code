# Todo list
- [] a macro to create table easily (adjust position automatically)
- [] box and minipage
- [] create a Poster style.

# Latex Documentation

Environment variable:
    TEX:    root of tex distribution
## TDS (Tex Directory Structure)
find related info in [TDS](tug.org/tds/tds.html)

* /usr/share/texlive/texmf-dist/tex/
    package source file.

* /usr/share/texlive/texmf-dist/doc/
    package documentation and examples.

# **texmf** tree: 
    when you ask TeX to use a certain class or package, it usually 
    looks for the necessary files in so-called **texmf** tree.

    There are three different **texmf** trees:
	* root **texmf** tree: $TEX
	* local **texmf** tree: usually /usr/local/share/texmf,
	/usr/local/texlive/texmf-local/
	* personal **texmf** tree: ~/texmf.



# files
\*.cls	    class file
\*.sty	    macro file that defines the style that we can use.


# fonts
install fonts file under $TEXMF/fonts dir. which will be searched directly
by TeX/LaTeX.


class >> style >> theme >> 

**Template**
    size and position of components.
**Theme**
    A theme is a collection of template, color, and font
