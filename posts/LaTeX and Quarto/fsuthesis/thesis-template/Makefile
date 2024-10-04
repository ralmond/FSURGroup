SHELL=/bin/bash

all: mythesis.pdf

# Simple case:  no figures or BibTeX
mythesis.pdf: mythesis.tex
	pdflatex mythesis
	pdflatex mythesis
	pdflatex mythesis

# More complicated case:  BibTeX invoked, PostScript figures
bibpost:
	latex mythesis
	bibtex mythesis
	latex mythesis
	latex mythesis
	dvipdf mythesis

# If all figures are PDF'd, then we can use pdflatex instead
# (This requires changing the [dvips] driver to [pdftex]
# on the \usepackage{graphics} line in mythesis.tex.)
bibpdf:
	pdflatex mythesis
	bibtex mythesis
	pdflatex mythesis
	pdflatex mythesis

distclean:
	-@rm -f *.{aux,toc,dvi,lof,lot,log,lom,bbl,bcf,blg,pdf,ps,out,run.xml} *~
