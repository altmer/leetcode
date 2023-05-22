class LanguageFilter
  MAX_WEIGHT = 2 ** 32

  def initialize(header)
    @langs_dictionary = {}
    @allowall = header == "*"

    accepted_langs = header.split(",").map(&:strip)
    accepted_langs.each_with_index do |lang, index|
      @langs_dictionary[lang] = index
    end
  end

  def perform(langs)
    return [] if langs.nil?
    return langs if @allowall

    langs.filter { |lang| lang_accepted?(lang) }.sort_by do |lang|
      sorting_score(lang)
    end
  end

  private

  def lang_accepted?(lang)
    @langs_dictionary.key?(lang) || @langs_dictionary.key?(catchall(lang))
  end

  def sorting_score(lang)
    [
      @langs_dictionary[lang] || MAX_WEIGHT,
      @langs_dictionary[catchall(lang)] || MAX_WEIGHT
    ].min
  end

  def catchall(lang)
    lang.split("-").first
  end
end
