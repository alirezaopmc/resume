FONTS_DIR := fonts
OUTPUT_DIR := output
TYPST := typst

.PHONY: all clean swe pm previews

all: swe pm

swe:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) swe-resume.typ $(OUTPUT_DIR)/alireza-jafartash-swe.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-swe.pdf"

pm:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) pm-resume.typ $(OUTPUT_DIR)/alireza-jafartash-pm.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-pm.pdf"

previews: all
	$(TYPST) compile --font-path $(FONTS_DIR) --format png swe-resume.typ $(OUTPUT_DIR)/swe-2p-{p}.png
	$(TYPST) compile --font-path $(FONTS_DIR) --format png pm-resume.typ $(OUTPUT_DIR)/pm-2p-{p}.png
	@echo "Rendered previews in $(OUTPUT_DIR)/"

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(OUTPUT_DIR)/*.png
