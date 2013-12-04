CONTENT=meta introduction background autotuning mm conclusion references
RES=gtx580.png openclmem.png tiles.png workflow.png

PFLAGS=-s -S --bibliography=$(HOME)/lib/references.bib --toc 
PHTMLFLAGS=-c html/style.css --mathml
PTEXFLAGS=--chapters --latex-engine=xelatex --template=tex/template.latex 

all: report.html report.pdf

report.html: $(CONTENT) $(RES)
	pandoc $(PFLAGS) $(PHTMLFLAGS) $(CONTENT) -o $@

report.pdf: $(CONTENT) $(RES)
	pandoc $(PFLAGS) $(PTEXFLAGS) $(CONTENT) -o $@

%.pdf: % $(RES)
	pandoc $(PFLAGS) --latex-engine=xelatex $< -o $@

%.png: %.svg
	inkscape $< --export-png=$@ -D

clean:
	$(RM) html/index.html report.pdf
