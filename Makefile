####################
# Makefile
####################

mainpages : index.Rmd concepts.Rmd languages.Rmd about.Rmd
		mkdir -p ./_languages
		mkdir -p ./_concepts
		for f in $^; do Rscript -e "require(rmarkdown); render_site('$$f')"; done
						
concepts : $(wildcard ./_concepts/*.Rmd)
		mv $^ ./
		for f in $(notdir $^); do Rscript -e "require(rmarkdown); render_site('$$f')"; done
		rm $(notdir $^)
		rm -r ./_concepts

languages : $(wildcard ./_languages/*.Rmd)
		mv $^ ./
		for f in $(notdir $^); do Rscript -e "require(rmarkdown); render_site('$$f')"; done
		rm $(notdir $^)
		rm -r ./_languages
		
all : mainpages concepts languages
