require_relative "helper"

module RailsHeroicon
  class Railtie < Rails::Railtie
    initializer "rails_heroicon.helper" do
      ActionView::Base.send :include, RailsHeroiconHelper # rubocop:disable Lint/SendWithMixinArgument
    end
  end
end
