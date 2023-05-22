# hello_test.rb
require "test/unit"
require_relative './accept_language'

class LanguageFilterTest < Test::Unit::TestCase
  def test_filtering_reorders
    filter = LanguageFilter.new("en-US, fr-CA, fr-FR")
    assert_equal ["en-US", "fr-FR"], filter.perform(["fr-FR", "en-US"])
  end

  def test_filtering
    filter = LanguageFilter.new("fr-CA, fr-FR")
    assert_equal ["fr-FR"], filter.perform(["en-US", "fr-FR"])
  end

  def test_filtering_single_language
    filter = LanguageFilter.new("en-US")
    assert_equal ["en-US"], filter.perform(["en-US", "fr-CA"])
  end

  def test_filtering_no_input
    filter = LanguageFilter.new("en-US")
    assert_equal [], filter.perform([])
  end

  def test_filtering_nil
    filter = LanguageFilter.new("en-US")
    assert_equal [], filter.perform(nil)
  end

  def test_filtering_catchall
    filter = LanguageFilter.new("en-US, en")
    assert_equal ["en-US", "en-GB"], filter.perform(["fr-FR", "en-GB", "en-US"])
  end

  def test_filtering_start
    filter = LanguageFilter.new("*")
    assert_equal ["fr-FR", "en-GB", "en-US"], filter.perform(["fr-FR", "en-GB", "en-US"])
  end
end
