## A Hugo project to set up Robin Carswell's personal site

A simple set up, per the instructions I found on the interwebs.


----------

## Local setup

The site needs two tools, and **both versions matter**. CI pins the same
versions in `.github/workflows/hugo.yml`.

| Tool | Version | Install |
|---|---|---|
| Hugo (extended) | 0.162.0 | `brew install hugo` |
| Dart Sass | 1.100.0 | `brew install sass/sass/sass` |

Hugo must be the **extended** edition, and Dart Sass must be installed
separately — the extended edition does *not* bundle it (only the Snap package
does, and Homebrew's Hugo is not a Snap).

## Building

Use the Makefile, not a bare `hugo`:

```
make build      # production build into ./public — what CI does
make preview    # production-environment preview server
make serve      # ordinary development server
make clean      # remove ./public and resources/_gen
```

`make check-tools` runs on every build and stops if the toolchain is wrong.

### Why the Makefile exists, and why bare `hugo` is a trap

**Hugo does not fail when Dart Sass is missing.** It silently falls back to the
embedded LibSass, exits 0, prints no warning — and emits different CSS.

Measured on a cold cache, 2026-09-02:

| | Stylesheet |
|---|---|
| With Dart Sass | 18,041 bytes |
| Without | 17,939 bytes |

The missing 102 bytes are the `.footer__disclaimer` rule, so the disclaimer in
the site footer renders unstyled. Nothing reports this. `hugo env` is the only
reliable tell: it prints a `dart-sass/implementation` line only when Dart Sass
is genuinely reachable, and `make check-tools` turns that into a hard failure.

A second failure mode, and the original bug: local Hugo ran six weeks ahead of
CI across an API-changing release, so the live site rendered differently from
local preview. `make check-tools` now refuses a version mismatch. Bump local and
CI together; for a deliberate one-off, `make build ALLOW_VERSION_DRIFT=1`.

Note the `[module.hugoVersion]` block in `config.toml` is a *declaration only* —
Hugo does not enforce it for a project's own root config (verified: a build
succeeds with `min = "0.999.0"`). The Makefile is the enforcement point.

### Previewing what production will actually look like

`hugo server` runs the **development** environment: no minification, no
fingerprinting, no integrity attributes. CI passes `--minify`, which also
minifies HTML — collapsing whitespace between inline elements, so spacing
differs slightly from a plain local preview. `make preview` runs the production
path instead, which is what to check before pushing anything layout-sensitive.

----------

(c) Robin Carswell 2021
