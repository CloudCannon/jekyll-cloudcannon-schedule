# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-cloudcannon-schedule/version"

Gem::Specification.new do |spec|
  spec.name        = "jekyll-cloudcannon-schedule"
  spec.summary     = "Automatically generates _schedule.txt for builds on CloudCannon."
  spec.version     = Jekyll::CloudCannonSchedule::VERSION
  spec.authors     = ["CloudCannon Inc."]
  spec.email       = "support@cloudcannon.com"
  spec.homepage    = "https://github.com/CloudCannon/jekyll-cloudcannon-schedule"
  spec.licenses    = ["MIT"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r!^bin/!) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r!^(test|spec|features)/!)
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "0.51"
end
