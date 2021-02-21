require_relative "rails_heroicon_helper"

module RailsHeroicon
  class Railtie < Rails::Railtie
    initializer "rails_heroicon.helper" do
      ActionView::Base.send :include, RailsHeroiconHelper # rubocop:disable Lint/SendWithMixinArgument
    end
  end
end
