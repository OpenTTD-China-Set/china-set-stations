# dependencies
GORENDER = ./gopath/bin/gorender --palette "vox/ttd_palette.json" -m "vox/manifest.json" -s 4 -overwrite
NMLC = nmlc
GCC = gcc


# building paths
BUILD_DIR = build

# voxel paths

VOX_DIR = vox
VOX_BUILDINGS = $(wildcard $(VOX_DIR)/buildings/*.vox)
VOX_PLATFORMS = $(wildcard $(VOX_DIR)/platforms/*.vox)
VOX_SHELTERS = $(wildcard $(VOX_DIR)/shelters/*.vox)
VOX_FENCES = $(wildcard $(VOX_DIR)/fences/*.vox)

VOX_FILES = $(VOX_BUILDINGS) $(VOX_PLATFORMS) $(VOX_SHELTERS) $(VOX_FENCES)

VOX_8BPP_FILES = $(patsubst %.vox,%_8bpp.png,$(VOX_FILES))
VOX_32BPP_FILES = $(patsubst %.vox,%_32bpp.png,$(VOX_FILES))
VOX_MASK_FILES = $(patsubst %.vox,%_mask.png,$(VOX_FILES))



%_8bpp.png %_32bpp.png %_mask.png: %.vox
	$(GORENDER) $<

# default rule
all: sprites code

sprites: $(VOX_8BPP_FILES) $(VOX_32BPP_FILES) $(VOX_MASK_FILES)

NML_FILE = cns.nml
CODE_FILES = $(shell find . -name '*.pnml') $(shell find . -name '*.lng') $(shell find . -name 'custom_tags.txt') indexes.pnml
INDEX_FILE = indexes.pnml
GRF_FILE = cns.grf

$(GRF_FILE): $(CODE_FILES)
	$(GCC) -E -x c -o $(NML_FILE) $(INDEX_FILE)
	$(NMLC) $(NML_FILE)

# Rule to run nmlc when the NML file changes
code: $(GRF_FILE) $(NML_FILE)

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
	@cp cns.grf ~/.local/share/openttd/newgrf/cns.grf
