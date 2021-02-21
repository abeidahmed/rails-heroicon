require_relative "rails_heroicon_helper"

module RailsHeroicon
  class Railtie < Rails::Railtie
    initializer "rails_heroicon.helper" do
      ActionView::Base include RailsHeroiconHelper
    end
  end
end
