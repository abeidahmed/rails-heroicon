require_relative "rails_heroicon/version"
require_relative "rails_heroicon/rails_heroicon"
require_relative "rails_heroicon/rails_heroicon_helper"
require_relative "rails_heroicon/railtie" if defined? Rails

module RailsHeroicon
  SOLID_ICON_PATH = File.join(File.dirname(__FILE__), "../icons/solid")
  OUTLINE_ICON_PATH = File.join(File.dirname(__FILE__), "../icons/outline")
end
