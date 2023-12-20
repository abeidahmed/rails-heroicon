require "test_helper"

class RailsHeroiconTest < Minitest::Test
  def test_version_number
    refute_nil RailsHeroicon::VERSION
  end
end
