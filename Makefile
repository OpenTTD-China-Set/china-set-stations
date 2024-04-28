# dependencies
GORENDER = ./gopath/bin/gorender --palette "vox/ttd_palette.json" -s 4 -overwrite
NMLC = nmlc
GCC = gcc

# utilities
GIT_NUMBER := $(shell git rev-list --count HEAD)


.PHONY: all sprites code clean clean_grf clean_png copy
# default rule
all: sprites code



# voxel paths
VOX_DIR = vox
VOX_FILES = $(wildcard $(VOX_DIR)/*/*.vox)

VOX_8BPP_FILES = $(addsuffix _8bpp.png, $(basename $(VOX_FILES)))
VOX_32BPP_FILES = $(addsuffix _32bpp.png, $(basename $(VOX_FILES)))
VOX_MASK_FILES = $(addsuffix _mask.png, $(basename $(VOX_FILES)))

VOX_GENREATED_FILES = $(VOX_8BPP_FILES) $(VOX_32BPP_FILES) $(VOX_MASK_FILES)

%_8bpp.png %_32bpp.png %_mask.png: %.vox
	$(GORENDER) -m "$(dir $<)/manifest.json" $<

# sprites
sprites: $(VOX_GENREATED_FILES)

# code
NML_FILE = cns.nml
CODE_FILES = $(shell find . \( -name '*.pnml' -o -name '*.lng' \)) $(INDEX_FILE)
INDEX_FILE = indexes.pnml
GRF_FILE = cns.grf

TAGS = tags.txt
CUSTOM_TAGS = custom_tags.txt

# Rule to run nmlc when the NML file changes
# The GRF file is rebuilt every time the PNML files or the graphics files are changed
$(CUSTOM_TAGS): $(TAGS)
	$(GCC) -E -x c -D 'GIT_NUMBER=$(GIT_NUMBER)' -o $@ $<

$(NML_FILE): $(CODE_FILES) $(VOX_GENREATED_FILES) $(CUSTOM_TAGS)
	$(GCC) -E -x c -D 'GIT_NUMBER=$(GIT_NUMBER)' -o $@ $(INDEX_FILE)

$(GRF_FILE): $(NML_FILE)
	$(NMLC) $<

# Rule to run nmlc when the NML file changes
code: $(GRF_FILE)

# clean
clean: clean_grf clean_png

clean_grf:
	@echo "Cleaning GRF and NML files"
	@rm -f *.grf
	@rm -f *.nml

clean_png:
	@echo "Cleaning PNG files"
	@find $(VOX_DIR) -name '*.png' -type f -delete

# this is only for debug purpose, you could modify it to copy the GRF to the OpenTTD data directory
# it should be something like /mnt/c/users/<username>/documents/openttd/newgrf on wsl
copy:
	@echo "Copying GRF files to OpenTTD data directory"
	@cp $(GRF_FILE) ~/.local/share/openttd/newgrf/$(GRF_FILE)
