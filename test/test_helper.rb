$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "rails_heroicon"

require "minitest/autorun"
require "rails/railtie"
require "rails_heroicon/railtie"

module RunInitializer
  def before_setup
    save_cache_store
  end

  def setup
    run_initializer
  end

  def teardown
    reset_cache_store
    run_initializer
  end

  def run_initializer
    ::RailsHeroicon::Railtie.initializers.find { |i| i.name == "rails_heroicon.cache" }.bind(RailsHeroicon::Railtie).run
  end

  def set_cache_store(store)
    ::RailsHeroicon::Railtie.config.rails_heroicon_cache_store = store
  end

  def save_cache_store
    @icon_cache_store = ::RailsHeroicon::Railtie.config.rails_heroicon_cache_store
  end

  def reset_cache_store
    raise "Cannot reset cache store, please set it before with #save_cache_store" unless instance_variable_defined?(:@icon_cache_store)

    set_cache_store @icon_cache_store
  end
end
