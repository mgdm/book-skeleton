.PHONY: phony

# FIGURES = $(shell find . -name '*.svg')

PANDOCFLAGS =                        \
  --table-of-contents                \
  --pdf-engine=xelatex               \
  --from=markdown                    \
  --number-sections                  \
  --indented-code-classes=javascript \
  --highlight-style=monochrome       \
  -V mainfont="ETBembo"              \
  -V documentclass=report            \
  -V papersize=A5                    \
  -V geometry:margin=1in

all: phony output/book.pdf

output/%.pdf: %.md default.yml Makefile | output
	pandoc default.yml $< -o $@ $(PANDOCFLAGS)

output/%.epub: %.md default.yml Makefile | output
	pandoc default.yml $< -o $@ $(PANDOCFLAGS)

output:
	mkdir ./output

clean: phony
	rm -rf ./output

open: phony output/book.pdf
	open output/book.pdf
