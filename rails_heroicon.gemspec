require_relative "lib/rails_heroicon/version"

Gem::Specification.new do |spec|
  spec.name = "rails_heroicon"
  spec.version = RailsHeroicon::VERSION
  spec.authors = ["abeidahmed"]
  spec.email = ["abeidahmed92@gmail.com"]

  spec.summary = "Ruby on Rails view helpers for the awesome Heroicons by Steve Schoger."
  spec.homepage = "https://github.com/abeidahmed/rails-heroicon"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abeidahmed/rails-heroicon"
  spec.metadata["changelog_uri"] = "https://github.com/abeidahmed/rails-heroicon/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*", "compressed/**/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview"
  spec.add_dependency "railties"
end
