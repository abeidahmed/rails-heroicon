require_relative "rails_heroicon/version"
require_relative "rails_heroicon/rails_heroicon"
require_relative "rails_heroicon/railtie" if defined? Rails

module RailsHeroicon
  SOLID_ICON_PATH = File.join(File.dirname(__FILE__), "..", "compressed", "solid")
  OUTLINE_ICON_PATH = File.join(File.dirname(__FILE__), "..", "compressed", "outline")
end
