module RailsHeroicon
  class Railtie < Rails::Railtie
    initializer "rails_heroicon.helper" do
      ActionView::Base include RailsHeroiconHelper
    end
  end
end
