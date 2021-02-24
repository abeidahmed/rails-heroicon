require_relative "lib/rails_heroicon/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_heroicon"
  spec.version       = RailsHeroicon::VERSION
  spec.authors       = ["abeidahmed"]
  spec.email         = ["abeidahmed92@gmail.com"]

  spec.summary       = "Ruby on Rails view helpers for the awesome Heroicons by Steve Schoger."
  spec.homepage      = "https://github.com/abeidahmed/rails-heroicon"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.6")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abeidahmed/rails-heroicon"
  spec.metadata["changelog_uri"] = "https://github.com/abeidahmed/rails-heroicon/blob/main/CHANGELOG.md"

  spec.files         = Dir["lib/**/*", "compressed/**/*", "CHANGELOG.md", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "byebug", ["~> 11.1", ">= 11.1.3"]
  spec.add_development_dependency "nokogiri", "~> 1.11.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
end
