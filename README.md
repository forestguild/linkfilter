# Link filters for Jekyll

[![Gem Version](https://badge.fury.io/rb/jekyll-linkfilter.svg)](https://badge.fury.io/rb/jekyll-linkfilter)

Collection of filters for urls.

## Usage

### `autonofollow`

Add `rel="nofollow" target="_blank"` to all external links

### `toAbsoluteUrls`

Replace anchor links like `<a href="#element-on-page">` with canonical versions, eg: `https://example.com/page#element-on-page`

### `toYandexTurboContent`

Special fixes for Yandex.Turbo, because their parsers raise warnings:

1. Remove navbars `<nav>` elements
2. Remove anchor links like `<a href="#element-on-page">` (`toAbsoluteUrls` will not help here, because Yandex will mark absolute url with anchor link as warning)
3. Remove table of contents, because it uses anchor links

### `canonical`

Canonicalize URL

Examples:

1. `wiki/some-guide/index.html` => `https://example.com/wiki/some-guide`
2. `wiki/some-guide/subguide.html` => `https://example.com/wiki/some-guide/subguide`
3. `amp/wiki/some-guide/subguide.html` => `https://example.com/wiki/some-guide/subguide`
