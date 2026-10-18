FONTS_DIR := fonts
OUTPUT_DIR := output
TYPST := typst

ATS_VERSION := v0.2.0
ATS_BIN := tools/ats/bin/tool-linux-x86_64
ATS_URL := https://github.com/NoahMustafa/open-ATS/releases/download/$(ATS_VERSION)/tool-linux-x86_64
ATS_SHA := 2a3dd861e8b8f94902b2665e8ba2b089da028988cabfb2527dd6f1078cd1ceca

.PHONY: all clean swe basalam pm previews ats ats-basalam ats-jd

BASALAM_PDF := $(OUTPUT_DIR)/alireza-jafartash-swe-basalam.pdf

all: swe pm

swe:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) swe-resume.typ $(OUTPUT_DIR)/alireza-jafartash-swe.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-swe.pdf"

basalam:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) swe-basalam-resume.typ $(BASALAM_PDF)
	@echo "Built: $(BASALAM_PDF)"

pm:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONTS_DIR) pm-resume.typ $(OUTPUT_DIR)/alireza-jafartash-pm.pdf
	@echo "Built: $(OUTPUT_DIR)/alireza-jafartash-pm.pdf"

previews: all
	$(TYPST) compile --font-path $(FONTS_DIR) --format png swe-resume.typ $(OUTPUT_DIR)/swe-{p}.png
	$(TYPST) compile --font-path $(FONTS_DIR) --format png pm-resume.typ $(OUTPUT_DIR)/pm-{p}.png
	@echo "Rendered previews in $(OUTPUT_DIR)/"

$(ATS_BIN):
	mkdir -p tools/ats/bin
	curl -fsSL -o $(ATS_BIN) $(ATS_URL)
	echo "$(ATS_SHA)  $(ATS_BIN)" | sha256sum -c -
	chmod +x $(ATS_BIN)

# $(1) = PDF to score, $(2) = JSON report to write.
define ats_gate
	$(ATS_BIN) $(1) --json > $(2)
	python3 tools/ats/check_score.py $(2)
	pdftotext -layout $(1) - | python3 tools/ats/check_order.py
endef

ats: swe $(ATS_BIN)
	$(call ats_gate,$(OUTPUT_DIR)/alireza-jafartash-swe.pdf,$(OUTPUT_DIR)/swe-ats.json)

ats-basalam: basalam $(ATS_BIN)
	$(call ats_gate,$(BASALAM_PDF),$(OUTPUT_DIR)/swe-basalam-ats.json)

ats-jd: swe $(ATS_BIN)
	@test -n "$(JD)" || { echo "Set JD=path/to/posting.txt"; exit 1; }
	$(ATS_BIN) $(OUTPUT_DIR)/alireza-jafartash-swe.pdf --jd "$(JD)" --json

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(OUTPUT_DIR)/*.png $(OUTPUT_DIR)/*.json
