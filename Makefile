KANJI = -kanji=jis
FONTMAP = -f ipaex.map -f ptex-ipaex.map

all: jfm.pdf jtex.pdf jtexdoc.pdf ptexdoc.pdf ptexskip.pdf \
	eptexdoc.pdf #eptex_resume.pdf

eptexdoc.pdf: eptexdoc.tex
	platex $(KANJI) eptexdoc.tex
	platex $(KANJI) eptexdoc.tex
	mendex -J eptexdoc.idx
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

.PHONY: clean
clean:
	rm -f *.dvi *.pdf
