# Help with making distrib

PDFLATEXSHELLESCAPE=pdflatex --shell-escape
PDFLATEX=pdflatex
LATEX=latex --shell-escape
TEX=tex
##BIBTEX=bibtex8 --csfile 88591sca.csf $(JOB)
BIBTEX=bibtex  $(JOB)
INDEX=makeindex -s gind.ist 
OPTIONS=
CHAPTERS=
TEXMF=../texmf
TEXINPUTS=
DISTRIBDIR=../mh

UPDMAP=updmap --quiet 
CHAPTERAUXS= 


breqn:
	$(TEX) breqn.dtx;
	$(PDFLATEXSHELLESCAPE) breqn.dtx;
	$(INDEX) breqn.idx;
	$(PDFLATEXSHELLESCAPE) breqn.dtx;
	$(INDEX) breqn.idx;
	$(PDFLATEXSHELLESCAPE) breqn.dtx;

flexisym:
	$(TEX) flexisym.dtx;
	$(PDFLATEXSHELLESCAPE) flexisym.dtx;
	$(INDEX) flexisym.idx;
	$(PDFLATEXSHELLESCAPE) flexisym.dtx;
	$(INDEX) flexisym.idx;
	$(PDFLATEXSHELLESCAPE) flexisym.dtx;

mathstyle:
	$(TEX) mathstyle.dtx;
	$(PDFLATEXSHELLESCAPE) mathstyle.dtx;
	$(INDEX) mathstyle.idx;
	$(PDFLATEXSHELLESCAPE) mathstyle.dtx;
	$(INDEX) mathstyle.idx;
	$(PDFLATEXSHELLESCAPE) mathstyle.dtx;

technotes:
	$(PDFLATEXSHELLESCAPE) breqn-technotes.tex;
	$(PDFLATEXSHELLESCAPE) eqlayouts.tex;

all:	flexisym mathstyle breqn technotes

copytomh: 
	cp breqn.dtx breqn.pdf \
	mathstyle.dtx mathstyle.pdf \
	flexisym.dtx flexisym.pdf \
	eqlayouts.tex eqlayouts.pdf \
	breqn-technotes.tex breqn-technotes.pdf \
	$(DISTRIBDIR)

