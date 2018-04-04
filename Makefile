DOCTARGET = jfm eptexdoc
# following documents are not maintained anymore;
# even some descriptions might be different from
# current status of pTeX
#   jtex_asciimw jtexdoc_asciimw
#   ptexdoc_asciimw ptexskip_asciimw
#   eptex_resume
PDFTARGET = $(addsuffix .pdf,$(DOCTARGET))
DVITARGET = $(addsuffix .dvi,$(DOCTARGET))
KANJI = -kanji=jis
FONTMAP = -f ipaex.map -f ptex-ipaex.map
TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)

all: $(PDFTARGET)

eptexdoc.pdf: eptexdoc.tex fam256p.tex fam256d.tex
	platex $(KANJI) eptexdoc.tex
	platex $(KANJI) eptexdoc.tex
	mendex -J -s gind.ist eptexdoc.idx
	platex $(KANJI) eptexdoc.tex
	platex $(KANJI) eptexdoc.tex
	dvipdfmx $(FONTMAP) eptexdoc.dvi
	rm -f *.aux *.log *.toc *.idx *.ind *.ilg *.out eptexdoc.dvi

.SUFFIXES: .tex .dvi .pdf
.tex.dvi:
	platex $(KANJI) $<
	platex $(KANJI) $<
	platex $(KANJI) $<
	rm -f *.aux *.log *.toc
.dvi.pdf:
	dvipdfmx $(FONTMAP) $<

.PHONY: install clean
install:
	mkdir -p ${TEXMF}/doc/ptex/ptex-base
	cp ./LICENSE ${TEXMF}/doc/ptex/ptex-base/
	cp ./README* ${TEXMF}/doc/ptex/ptex-base/
	cp ./Makefile ${TEXMF}/doc/ptex/ptex-base/
	cp ./*.pdf ${TEXMF}/doc/ptex/ptex-base/
	ls ./*.tex | \
	grep -v ptex.tex | grep -v ascii-jplain.tex | grep -v kinsoku.tex | \
	xargs -I % cp % ${TEXMF}/doc/ptex/ptex-base/
	cp ./Change* ${TEXMF}/doc/ptex/ptex-base/
	mkdir -p ${TEXMF}/tex/ptex/ptex-base
	cp ./ptex.tex ${TEXMF}/tex/ptex/ptex-base/
	cp ./ascii-jplain.tex ${TEXMF}/tex/ptex/ptex-base/
	cp ./kinsoku.tex ${TEXMF}/tex/ptex/ptex-base/
	cp ./*.ini ${TEXMF}/tex/ptex/ptex-base/
	cp ./eptex.src ${TEXMF}/tex/ptex/ptex-base/
	cp ./eptexdefs.lib  ${TEXMF}/tex/ptex/ptex-base/
clean:
	rm -f $(DVITARGET) $(PDFTARGET)
