MAIN     = main
LATEX    = pdflatex
BIBTEX   = bibtex
LATEXFLAGS = -interaction=nonstopmode -halt-on-error

FIGS_DIR  = figures
FIGS_SRC  = $(wildcard $(FIGS_DIR)/*.tex)
FIGS_PDF  = $(FIGS_SRC:.tex=.pdf)

.PHONY: all figs clean distclean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib $(wildcard sections/*.tex) $(FIGS_PDF)
	$(LATEX) $(LATEXFLAGS) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN)

figs: $(FIGS_PDF)

$(FIGS_DIR)/%.pdf: $(FIGS_DIR)/%.tex
	$(LATEX) $(LATEXFLAGS) -output-directory=$(FIGS_DIR) $<

clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).log \
	       $(MAIN).out $(MAIN).toc $(MAIN).fls $(MAIN).fdb_latexmk
	rm -f $(FIGS_DIR)/*.aux $(FIGS_DIR)/*.log

distclean: clean
	rm -f $(MAIN).pdf $(FIGS_PDF)
