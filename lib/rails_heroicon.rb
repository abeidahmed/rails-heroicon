require "json"
require_relative "rails_heroicon/version"
require_relative "rails_heroicon/rails_heroicon"
require_relative "rails_heroicon/railtie" if defined? Rails

module RailsHeroicon
  ICON_PATH = File.join(File.dirname(__FILE__), "../compressed/icons.json")
  ICONS = JSON.parse(File.read(ICON_PATH)).freeze
end
