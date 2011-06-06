
DISTRIB-DIR = distrib

README = README

BREQN-DIR = breqn

BREQN-DTX = \
	breqn.dtx \
	flexisym.dtx \
	mathstyle.dtx

BREQN-TEX = \
	breqn-technotes.tex

BREQN-PDF = \
	breqn.pdf \
	flexisym.pdf \
	mathstyle.pdf \
	breqn-technotes.pdf


BREQN-DERIVED = \
	breqn.sty \
	flexisym.sty \
	cmbase.sym \
	mathpazo.sym \
	mathptmx.sym \
	msabm.sym \
	mathstyle.sty \



MH-DIR = mhmath

MH-DTX = \
	empheq.dtx \
	mhsetup.dtx \
	mathtools.dtx

MH-TEX = 

MH-PDF = \
	empheq.pdf \
	mhsetup.pdf \
	mathtools.pdf


MH-DERIVED = \
	empheq.sty \
	mhsetup.sty \
	mathtools.sty

all: distrib

tds-dirs:
	mkdir -p $(DISTRIB-DIR)
	mkdir -p $(DISTRIB-DIR)/mh
	mkdir -p $(DISTRIB-DIR)/mh-tds
	mkdir -p $(DISTRIB-DIR)/mh-tds/doc
	mkdir -p $(DISTRIB-DIR)/mh-tds/doc/latex
	mkdir -p $(DISTRIB-DIR)/mh-tds/doc/latex/mh
	mkdir -p $(DISTRIB-DIR)/mh-tds/source
	mkdir -p $(DISTRIB-DIR)/mh-tds/source/latex
	mkdir -p $(DISTRIB-DIR)/mh-tds/source/latex/mh
	mkdir -p $(DISTRIB-DIR)/mh-tds/tex
	mkdir -p $(DISTRIB-DIR)/mh-tds/tex/latex
	mkdir -p $(DISTRIB-DIR)/mh-tds/tex/latex/mh


tds-dirs-clean: tds-dirs
	rm -f $(DISTRIB-DIR)/mh-tds/doc/latex/mh/*
	rm -f $(DISTRIB-DIR)/mh-tds/source/latex/mh/*
	rm -f $(DISTRIB-DIR)/mh-tds/tex/latex/mh/*
	rm -f $(DISTRIB-DIR)/mh/*
	rm -f $(DISTRIB-DIR)/mh.zip
	rm -f $(DISTRIB-DIR)/mh.tds.zip

mh-styles:
	cd $(MH-DIR) ; for f in $(MH-DTX) ; do tex $$f  ; done 

mh-pdfs: mh-styles
# three runs should suffice
	cd $(MH-DIR) ; for f in $(MH-DTX) ; do pdflatex $$f ; done 
	cd $(MH-DIR) ; for f in $(MH-DTX) ; do pdflatex $$f ; done 
	cd $(MH-DIR) ; for f in $(MH-DTX) ; do pdflatex $$f ; done 


mh-distrib: tds-dirs mh-pdfs
	cd $(MH-DIR) ; \
	cp $(MH-DERIVED) ../$(DISTRIB-DIR)/mh-tds/tex/latex/mh  ; \
	cp $(MH-DTX) $(MH-TEX) ../$(DISTRIB-DIR)/mh-tds/source/latex/mh ;\
	cp $(MH-PDF) ../$(DISTRIB-DIR)/mh-tds/doc/latex/mh ;\
	cp $(MH-PDF) $(MH-DTX) $(MH-TEX) ../$(DISTRIB-DIR)/mh



breqn-styles:
	cd $(BREQN-DIR) ; for f in $(BREQN-DTX) ; do tex $$f  ; done 

breqn-pdfs: breqn-styles
# three runs should suffice
	cd $(BREQN-DIR) ; for f in $(BREQN-DTX) $(BREQN-TEX); \
	do pdflatex $$f ; done 
	cd $(BREQN-DIR) ; for f in $(BREQN-DTX) $(BREQN-TEX); \
	do pdflatex $$f ; done 
	cd $(BREQN-DIR) ; for f in $(BREQN-DTX) $(BREQN-TEX); \
	do pdflatex $$f ; done 


breqn-distrib: tds-dirs breqn-pdfs
	cd $(BREQN-DIR) ; \
	cp $(BREQN-DERIVED) ../$(DISTRIB-DIR)/mh-tds/tex/latex/mh  ; \
	cp $(BREQN-DTX) $(BREQN-TEX) ../$(DISTRIB-DIR)/mh-tds/source/latex/mh ;\
	cp $(BREQN-PDF) ../$(DISTRIB-DIR)/mh-tds/doc/latex/mh ;\
	cp $(BREQN-PDF) $(BREQN-DTX) $(BREQN-TEX) ../$(DISTRIB-DIR)/mh




distrib: tds-dirs-clean breqn-distrib mh-distrib 
	cp  $(README) $(DISTRIB-DIR)/mh
	cp  $(README) $(DISTRIB-DIR)/mh-tds/doc/latex/mh
	cd $(DISTRIB-DIR)/mh-tds ; zip -r ../mh.tds.zip * 
	cd $(DISTRIB-DIR) ; zip -r mh.zip mh mh.tds.zip 

