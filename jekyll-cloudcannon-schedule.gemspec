# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "jekyll-cloudcannon-schedule/version"

Gem::Specification.new do |spec|
  spec.name        = "jekyll-cloudcannon-schedule"
  spec.summary     = "Automatically generates _schedule.txt for builds on CloudCannon"
  spec.version     = Jekyll::CloudCannonSchedule::VERSION
  spec.authors     = ["CloudCannon"]
  spec.email       = ["support@cloudcannon.com"]
  spec.homepage    = "https://github.com/cloudcannon/jekyll-cloudcannon-schedule"
  spec.licenses    = ["MIT"]
  spec.require_paths = ["lib"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r!^bin/!) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r!^(test|spec|features)/!)

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_dependency "jekyll", ">= 2.4.0", "< 5"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rubocop", "~> 0.80"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.11"
end
