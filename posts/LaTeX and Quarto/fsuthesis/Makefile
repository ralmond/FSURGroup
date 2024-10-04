SHELL=/bin/bash

all: fsuthesis.cls fsuthesis.pdf user-guide.pdf

user-guide.pdf: user-guide.tex
	pdflatex user-guide
	pdflatex user-guide
	makeindex user-guide
	pdflatex user-guide
	pdflatex user-guide
	-@touch user-guide.pdf

fsuthesis.cls: fsuthesis.dtx fsuthesis.ins
	latex fsuthesis.ins

fsuthesis.pdf: fsuthesis.gls fsuthesis.ind
	pdflatex fsuthesis.dtx
	-@sleep 1
	-@touch fsuthesis.gls fsuthesis.ind
	-@sleep 1
	-@touch fsuthesis.pdf

fsuthesis.gls: fsuthesis.glo
	makeindex -s gglo.ist -o fsuthesis.gls fsuthesis.glo

fsuthesis.ind: fsuthesis.idx
	makeindex -s gind.ist -o fsuthesis.ind fsuthesis.idx

fsuthesis.glo fsuthesis.idx: fsuthesis.dtx
	pdflatex fsuthesis.dtx

clean:
	@-rm -f *.log *.aux *.toc *.lot *.lof *.ind *.idx *.gls *.glo *.ilg user-guide.out

distclean: clean
	@-rm -f fsuthesis.pdf fsuthesis.cls *.dvi *~

install: fsuthesis.cls
	-@/bin/rm -f thesis-template/fsuthesis.cls sample/fsuthesis.cls
	cp fsuthesis.cls thesis-template/
	cp fsuthesis.cls sample/
	chmod 444 thesis-template/fsuthesis.cls sample/fsuthesis.cls

package: user-guide.pdf install distclean
	(cd thesis-template; make distclean)
	(cd sample; make veryclean; make; make distclean)
	find . -exec chmod +r '{}' \;
	find . -type d -exec chmod +x '{}' \;
	(cd ..; if [ -f fsuthesis.zip ]; then /bin/rm fsuthesis.zip; fi; \
	   zip -9 -r -y -l fsuthesis.zip fsuthesis -x \*.git\* \*.Bret; \
	   /bin/mv -f fsuthesis.zip zips/fsu-latex-template-`date +%Y%m%d`.zip)
