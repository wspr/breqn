
DISTRIB-DIR = distrib

README = README.markdown

BREQN-DTX = \
	breqn.dtx \
	flexisym.dtx \
	mathstyle.dtx

BREQN-PDF = \
	breqn.pdf \
	flexisym.pdf \
	mathstyle.pdf


BREQN-DERIVED = \
	breqn.sty \
	flexisym.sty \
	cmbase.sym \
	mathpazo.sym \
	mathptmx.sym \
	msabm.sym \
	mathstyle.sty \

all: distrib

tds-dirs:
	mkdir -p $(DISTRIB-DIR)
	mkdir -p $(DISTRIB-DIR)/breqn
	mkdir -p $(DISTRIB-DIR)/breqn-tds
	mkdir -p $(DISTRIB-DIR)/breqn-tds/doc
	mkdir -p $(DISTRIB-DIR)/breqn-tds/doc/latex
	mkdir -p $(DISTRIB-DIR)/breqn-tds/doc/latex/breqn
	mkdir -p $(DISTRIB-DIR)/breqn-tds/source
	mkdir -p $(DISTRIB-DIR)/breqn-tds/source/latex
	mkdir -p $(DISTRIB-DIR)/breqn-tds/source/latex/breqn
	mkdir -p $(DISTRIB-DIR)/breqn-tds/tex
	mkdir -p $(DISTRIB-DIR)/breqn-tds/tex/latex
	mkdir -p $(DISTRIB-DIR)/breqn-tds/tex/latex/breqn


tds-dirs-clean: tds-dirs
	rm -f $(DISTRIB-DIR)/breqn-tds/doc/latex/breqn/*
	rm -f $(DISTRIB-DIR)/breqn-tds/source/latex/breqn/*
	rm -f $(DISTRIB-DIR)/breqn-tds/tex/latex/breqn/*
	rm -f $(DISTRIB-DIR)/breqn/*
	rm -f $(DISTRIB-DIR)/breqn.zip
	rm -f $(DISTRIB-DIR)/breqn.tds.zip

breqn-styles:
	for f in $(BREQN-DTX) ; do tex --interaction=batchmode $$f  ; done 

breqn-pdfs: breqn-styles
# three runs should suffice
	for f in $(BREQN-DTX); \
	do pdflatex --draftmode --interaction=batchmode $$f ; done 
	for f in $(BREQN-DTX); \
	do pdflatex -—draftmode --interaction=batchmode $$f ; done 
	for f in $(BREQN-DTX); \
	do pdflatex --interaction=batchmode $$f ; done 

breqn-distrib: tds-dirs breqn-pdfs
	cp $(BREQN-DERIVED) $(DISTRIB-DIR)/breqn-tds/tex/latex/breqn  ; \
	cp $(BREQN-DTX) $(BREQN-TEX) $(DISTRIB-DIR)/breqn-tds/source/latex/breqn ;\
	cp $(BREQN-PDF) $(DISTRIB-DIR)/breqn-tds/doc/latex/breqn ;\
	cp $(BREQN-PDF) $(BREQN-DTX) $(BREQN-TEX) $(DISTRIB-DIR)/breqn

distrib: tds-dirs-clean breqn-distrib
	cp  $(README) $(DISTRIB-DIR)/breqn/README
	cp  $(README) $(DISTRIB-DIR)/breqn-tds/doc/latex/breqn/README
	cd $(DISTRIB-DIR)/breqn-tds ; zip -r breqn.tds.zip * 
	cd $(DISTRIB-DIR) ; zip -r breqn.zip breqn breqn.tds.zip 

