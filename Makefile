# Makefile for .tex files with the hogent-exam documentclass

.POSIX:            # Get reliable POSIX behaviour
.SUFFIXES:         # Ignore built-in inference rules
.DELETE_ON_ERROR:  # Delete incomplete pdf/aux/idx files when TeX aborts with an error

out_dir := out
sources := $(wildcard *.tex)
assignments := $(patsubst %.tex,$(out_dir)/%.pdf,$(sources))
solutions := $(patsubst %.tex,$(out_dir)/%-opl.pdf,$(sources))

latex_cmd := xelatex -synctex=1 -interaction=nonstopmode -shell-escape -output-directory="$(out_dir)"

help: ## Toon deze hulpboodschap
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@printf "Opgave genereren: make NAAM.pdf\n"
	@printf "\033[36m%s\033[0m\n" $(assignments)
	@printf "Oplossing genereren: make NAAM-opl.pdf\n"
	@printf "\033[36m%s\033[0m\n" $(solutions)

all: $(assignments) $(solutions) ## Genereer alle opgaven

$(out_dir)/%.pdf: %.tex
	@mkdir -p "$(@D)"
	$(latex_cmd) $<
	while grep 'Rerun to get ' $(out_dir)/$*.log ; do $(latex_cmd) $< ; done

$(out_dir)/%-opl.pdf: %.tex
	@mkdir -p "$(@D)"
	# Vervang \solution* door \solutiontrue in opgave
	sed -i 's/^\\solution.*$$/\\solutiontrue/' $<
	# Voorbeeldoplossing genereren met geschikte naam (NAAM-opl.pdf)
	$(latex_cmd) -jobname=$(patsubst %.tex,%-opl,$<) $<
	while grep 'Rerun to get ' $(out_dir)/$*-opl.log ; do $(latex_cmd) -jobname=$(patsubst %.tex,%-opl,$<) $< ; done
	# Wijziging door sed ongedaan maken
	sed -i 's/^\\solution.*$$/\\solutionfalse/' $<
	# markeer pdf als up-to-date
	@touch $@

.PHONY : clean mrproper

clean: ## Verwijder LaTeX hulpbestanden
	rm -f $(out_dir)/*.{bak,aux,log,nav,out,snm,ptc,toc,bbl,blg,idx,ilg,ind,tcp,vrb,tps,log,lot,synctex.gz,fls,fdb_latexmk,bcf,run.xml}

mrproper: clean ## Verwijder LaTeX hulpbestanden én PDFs
	rm $(out_dir)/*.pdf
