# frozen_string_literal: true

require "test_helper"

module RailsHeroicon
  class RailtieTest < Minitest::Test
    include RunInitializer

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

    class DefaultCacheStoreTest < RailtieTest
      def test_default_config
        assert_equal :memory_store, ::RailsHeroicon::Railtie.config.rails_heroicon_cache_store
      end

      def test_default_cache
        assert_instance_of ActiveSupport::Cache::MemoryStore, ::RailsHeroicon.cache
      end
    end

    class ChangeCacheStoreTest < RailtieTest
      def setup
        set_cache_store :null_store
        super
      end

      def test_changed_cache
        assert_instance_of ActiveSupport::Cache::NullStore, ::RailsHeroicon.cache
      end
    end
  end
end
