build:
	rm -f ./*.gem
	gem build jekyll-linkfilter.gemspec

push:
	gem push ./*.gem
