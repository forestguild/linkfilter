Gem::Specification.new do |s|
    s.name        = 'jekyll-linkfilter'
    s.version     = '1.0.0'
    s.date        = '2019-04-08'
    s.summary     = "Link filters for Jekyll"
    s.description = "Link filters for Jekyll. Check README for example"
    s.authors     = ["Nikita Chernyi"]
    s.email       = 'github@rakshazi.me'
    s.files       = `git ls-files`.split($INPUT_RECORD_SEPARATOR).grep(%r!^lib/!)
    s.require_paths = %w(lib)
    s.homepage    = 'https://github.com/forestguild/linkfilter'
    s.license     = 'MIT'
    s.metadata = {
        "bug_tracker_uri"   => "https://github.com/forestguild/linkfilter",
        "changelog_uri"     => "https://github.com/forestguild/linkfilter/releases",
        "documentation_uri" => "https://github.com/forestguild/linkfilter/blob/master/README.md",
        "homepage_uri"      => "https://github.com/forestguild/linkfilter",
        "source_code_uri"   => "https://github.com/forestguild/linkfilter",
    }
    s.required_ruby_version = '>=2.0.0'
    s.add_runtime_dependency 'jekyll', '~> 3.8.5', '>=3.0.0'
    s.add_runtime_dependency 'nokogiri', '~> 1.10.1', '>=1.0.0'
end
