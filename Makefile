# Makefile
#
.POSIX:     # Get reliable POSIX behaviour
.SUFFIXES:  # Ignore built-in inference rules

latex_cmd := pdflatex -synctex=1 -interaction=nonstopmode -shell-escape

sources := $(wildcard *.tex)
assignments := $(patsubst %.tex,%.pdf,$(sources))
solutions := $(patsubst %.tex,%-opl.pdf,$(sources))

help: ## Toon deze hulpboodschap
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@printf "Opgave genereren: make NAAM.pdf\n"
	@printf "\033[36m%s\033[0m\n" $(assignments)
	@printf "Oplossing genereren: make NAAM-opl.pdf\n"
	@printf "\033[36m%s\033[0m\n" $(solutions)


all: $(assignments) $(solutions) ## Genereer alle opgaven

%.pdf: %.tex
	$(latex_cmd) $<

%-opl.pdf: %.tex
	# Vervang \solution* door \solutiontrue in opgave
	sed -i 's/^\\solution.*$$/\\solutiontrue/' $<
	# Voorbeeldoplossing genereren met geschikte naam (NAAM-popl.pdf)
	$(latex_cmd) -jobname=$(patsubst %.tex,%-opl,$<) $<
	# Wijziging door sed ongedaan maken
	git checkout -- $<

.PHONY : clean mrproper

clean:
	rm -f ./*.{bak,aux,log,nav,out,snm,ptc,toc,bbl,blg,idx,ilg,ind,tcp,vrb,tps,log,lot,synctex.gz,fls,fdb_latexmk,bcf,run.xml}

mrproper: clean
	rm *.pdf
