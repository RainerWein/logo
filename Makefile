SVG		:= $(wildcard *.svg)
PNG		:= $(SVG:%.svg=%.png)
PDF		:= $(SVG:%.svg=%.pdf)

.PHONY: all clean png pdf

all: $(PNG) $(PDF)
png: $(PNG)
pdf: $(PDF)

$(PNG): $(SVG)
	inkscape --export-png=$@ $<
	# rsvg --format png $< > $@

$(PDF): $(SVG)
	inkscape --export-pdf=$@ $<
	# rsvg --format pdf $< > $@

clean:
	rm -rf $(PNG) $(PDF)
