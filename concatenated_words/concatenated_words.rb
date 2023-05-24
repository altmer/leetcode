class ConcatenatedWords
  attr_reader :dict

  def initialize(words)
    @dict = Set.new
    words.each do |word|
      @dict.add(word)
    end

    @memo = {}
  end

  def perform
    @dict.select { |word| dfs(word) }
  end

  private

  def dfs(word)
    return false if word.nil?
    return true if @memo[word]

    (0..word.size).each do |split_index|
      prefix = word[0..split_index]
      suffix = word[split_index+1..word.size]
      return @memo[word] = true if @dict.include?(prefix) && @dict.include?(suffix)
      return @memo[word] = true if @dict.include?(prefix) && dfs(suffix)
    end

    @memo[word] = false
  end
end
