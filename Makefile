####################
# Makefile
####################

mainpages : index.Rmd concepts.Rmd languages.Rmd about.Rmd
		mkdir -p ./_languages
		mkdir -p ./_concepts
		for f in $^; do Rscript -e "require(rmarkdown); render_site('$$f')"; done
						
concs : $(wildcard ./_concepts/*.Rmd)
		mv $^ ./
		for f in $(notdir $^); do Rscript -e "require(rmarkdown); render_site('$$f')"; done
		rm $(notdir $^)
		rm -r ./_concepts

langs : $(wildcard ./_languages/*.Rmd)
		mv $^ ./
		mv $(addsuffix .html,$(basename $^)) ./
		for f in $(notdir $^); do Rscript -e "require(rmarkdown); render_site('$$f')"; done
		rm $(notdir $^)
		rm $(addsuffix .html,$(basename $(notdir $^)))
		rm -r ./_languages
		
all : mainpages concs langs
