default: clean all

all: \
	network.pptx \
	layer_1.pptx \
	smart_contracts.pptx \
	network.pdf\
	layer_1.pdf \
	smart_contracts.pdf

release: clean all zip

clean:
	rm -f ./*.pptx ./*.pdf ./*.zip

network.pptx:
	pandoc network.md -o network.pptx

layer_1.pptx:
	pandoc layer_1.md -o layer_1.pptx

smart_contracts.pptx:
	pandoc smart_contracts.md -o smart_contracts.pptx

network.pdf:
	pandoc network.md -o network.pdf

layer_1.pdf:
	pandoc layer_1.md -o layer_1.pdf

smart_contracts.pdf:
	pandoc smart_contracts.md -o smart_contracts.pdf

zip:
	zip algo-edu-$(shell git rev-parse --short HEAD) ./*.md ./*.pptx ./*.pdf

