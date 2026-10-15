FONTS_DIR := fonts
OUTPUT_DIR := output
TYPST := typst

.PHONY: all clean swe pm swe-ext pm-ext previews

all: swe pm swe-ext pm-ext

swe:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) swe-resume.typ $(OUTPUT_DIR)/alireza-jafartash-swe.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-swe.pdf"

pm:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) pm-resume.typ $(OUTPUT_DIR)/alireza-jafartash-pm.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-pm.pdf"

swe-ext:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) swe-resume-extended.typ $(OUTPUT_DIR)/alireza-jafartash-swe-extended.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-swe-extended.pdf"

pm-ext:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) pm-resume-extended.typ $(OUTPUT_DIR)/alireza-jafartash-pm-extended.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-pm-extended.pdf"

previews: all
	$(TYPST) compile --font-path $(FONTS_DIR) --format png swe-resume.typ $(OUTPUT_DIR)/swe-{p}.png
	$(TYPST) compile --font-path $(FONTS_DIR) --format png pm-resume.typ $(OUTPUT_DIR)/pm-{p}.png
	@echo "Rendered previews in $(OUTPUT_DIR)/"

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(OUTPUT_DIR)/*.png
