KANJI = -kanji=jis
FONTMAP = -f ipaex.map -f ptex-ipaex.map
TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)

all:
	echo Nothing to be built.

.PHONY: install
install:
	mkdir -p ${TEXMF}/doc/ptex/ptex-base
	cp ./LICENSE ${TEXMF}/doc/ptex/ptex-base/
	cp ./README* ${TEXMF}/doc/ptex/ptex-base/
	cp ./Makefile ${TEXMF}/doc/ptex/ptex-base/
	cp ./Change* ${TEXMF}/doc/ptex/ptex-base/
	mkdir -p ${TEXMF}/tex/ptex/ptex-base
	cp ./ptex.tex ${TEXMF}/tex/ptex/ptex-base/
	cp ./ascii-jplain.tex ${TEXMF}/tex/ptex/ptex-base/
	cp ./kinsoku.tex ${TEXMF}/tex/ptex/ptex-base/
	cp ./*.ini ${TEXMF}/tex/ptex/ptex-base/
	cp ./eptex.src ${TEXMF}/tex/ptex/ptex-base/
	cp ./eptexdefs.lib  ${TEXMF}/tex/ptex/ptex-base/
