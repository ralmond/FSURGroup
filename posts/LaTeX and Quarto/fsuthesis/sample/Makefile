SHELL=/bin/bash

SRC = thesis.tex \
	math.tex \
	citations.tex \
	figures.tex \
	tables.tex \
	appendix.tex \
        history.tex \
	tests.tex

all: thesis.pdf

# The first run...
thesis.aux thesis.bcf: $(SRC) myrefs.bib fsuthesis.cls
	-@rm -f thesis.{aux,toc,dvi,lof,lot,log,lom,bbl,bcf,blg,out,run.xml}
	pdflatex thesis
	-@rm -f thesis.{toc,dvi,lof,lot,log,lom,blg,out}

thesis.bbl: thesis.aux thesis.bcf
	biber thesis

# The final run...
thesis.pdf: thesis.aux thesis.bbl
	-@rm -f thesis.pdf
	-@pdflatex -interaction=nonstopmode thesis
	pdflatex thesis
	pdflatex thesis
	-@if [ -f thesis.pdf ]; then touch thesis.pdf; fi

thesis.dvi: thesis.aux thesis.bbl
	-@rm thesis.dvi
	-@latex -interaction=nonstopmode thesis
	latex thesis
	latex thesis
	-@touch thesis.aux thesis.bcf thesis.bbl
	-@if [ -f thesis.dvi ]; then touch thesis.dvi; fi

thesis.ps: thesis.dvi
	dvips -o thesis.ps thesis.dvi

clean:
	-@rm -f thesis.{aux,toc,dvi,lof,lot,log,lom,bbl,bcf,blg,out,run.xml}

veryclean: clean
	-@rm -f thesis.{ps,pdf} *~

distclean: clean
	-@rm -f thesis.ps *~
