# robincarswell.com — build entrypoints
#
# WHY THIS FILE EXISTS
#
# Hugo does not fail when Dart Sass is missing. It silently falls back to the
# embedded LibSass and emits DIFFERENT CSS, with exit code 0 and no warning.
# Measured 2026-09-02 on a cold cache: with Dart Sass the stylesheet is 18,041
# bytes; without it, 17,939 — the missing 102 bytes are the .footer__disclaimer
# rule (themes/anatole/assets/scss/partials/components/_footer.scss:48), so the
# site's disclaimer text renders unstyled. Nothing anywhere reports this.
#
# `hugo env` is the probe that tells the two apart: it prints a
# dart-sass/implementation line only when Dart Sass is actually reachable.
# check-tools below turns that into a hard failure, which is the whole point.
#
# Use `make build` / `make preview` rather than calling hugo directly. A bare
# `hugo` invocation bypasses this guard and can still degrade silently.
#
# Background: pa-lq75.

HUGO_EXPECTED      := 0.162.0
DART_SASS_EXPECTED := 1.100.0

.PHONY: help check-tools build preview serve clean

help:
	@echo "make check-tools  verify Hugo + Dart Sass are present and correct"
	@echo "make build        production build into ./public (what CI does)"
	@echo "make preview      production-environment preview server"
	@echo "make serve        ordinary development server"
	@echo "make clean        remove ./public and the local resource cache"

# Hard-fails when Dart Sass is unreachable. Do not soften this to a warning:
# a missing transpiler produces a silently wrong site, which is worse than a
# stopped build.
check-tools:
	@command -v hugo >/dev/null 2>&1 || { \
	    echo "ERROR: hugo not found on PATH."; \
	    echo "  brew install hugo"; \
	    exit 1; }
	@hugo env | grep -q 'dart-sass/implementation' || { \
	    echo "ERROR: Dart Sass is NOT reachable by Hugo."; \
	    echo ""; \
	    echo "  Hugo would fall back to LibSass and emit different CSS WITHOUT"; \
	    echo "  failing, so this build has been stopped instead."; \
	    echo ""; \
	    echo "  Fix:  brew install sass/sass/sass"; \
	    echo "  Check: hugo env | grep dart-sass"; \
	    exit 1; }
	@[ -n "$(ALLOW_VERSION_DRIFT)" ] || hugo version | grep -q 'v$(HUGO_EXPECTED)' || { \
	    echo "ERROR: Hugo version drift. Expected $(HUGO_EXPECTED), CI pins $(HUGO_EXPECTED)."; \
	    echo "  got: $$(hugo version)"; \
	    echo ""; \
	    echo "  This is the original pa-lq75 bug: local ran ahead of CI for six"; \
	    echo "  weeks across an API-changing release and the site rendered"; \
	    echo "  differently. Bump CI and local together, not one of them."; \
	    echo ""; \
	    echo "  Override for a one-off:  make build ALLOW_VERSION_DRIFT=1"; \
	    exit 1; }
	@hugo env | grep -q 'dart-sass/implementation="$(DART_SASS_EXPECTED)"' || \
	    echo "WARNING: expected Dart Sass $(DART_SASS_EXPECTED); CI pins $(DART_SASS_EXPECTED). Output may differ from production."

build: check-tools
	hugo --environment production --minify

# The production path, previewable before pushing. `hugo server` alone runs the
# development environment, which skips minification and fingerprinting.
preview: check-tools
	hugo server --environment production --minify

serve: check-tools
	hugo server

clean:
	rm -rf public resources/_gen
