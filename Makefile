all: network layer_1 smart_contracts

network:
	pandoc network.md -o network.pptx

layer_1:
	pandoc layer_1.md -o layer_1.pptx

smart_contracts:
	pandoc smart_contracts.md -o smart_contracts.pptx