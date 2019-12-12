####################
# Makefile
####################

mainpages : index.Rmd concepts.Rmd languages.Rmd about.Rmd
		mkdir -p ./_languages
		mkdir -p ./_concepts
		Rscript --vanilla makepages.R $^
		#for f in $^; do Rscript -e "require(rmarkdown); render_site('$$f')"; done
						
concepts : $(wildcard ./_concepts/*.Rmd)
		mv $^ ./
		#for f in $(notdir $^); do Rscript -e "require(rmarkdown); render_site('$$f')"; done
		Rscript --vanilla makepages.R $(notdir $^)
		#realpath -z $(notdir $^) | xargs -0 Rscript --vanilla makepages.R
		rm $(notdir $^)
		rm -r ./_concepts

languages : $(wildcard ./_languages/*.Rmd)
		mv $^ ./
		#for f in $(notdir $^); do Rscript -e "require(rmarkdown); render_site('$$f')"; done
		#Rscript --vanilla makepages.R $(notdir $^)
		Rscript --vanilla makepages.R $(notdir $^)
		rm $(notdir $^)
		rm -r ./_languages
		
all : mainpages concepts languages
