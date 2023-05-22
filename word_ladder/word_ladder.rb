class WordLadder
  attr_reader :graph, :start, :finish
  def initialize(start, finish, word_list)
    @start = start
    @finish = finish
    @word_list = Set.new(word_list)
  end

  def perform
    return 0 unless @word_list.include?(@finish)

    queue = [@start]
    distance = {
      @start => 0
    }

    while queue.any?
      current = queue.shift
      current_distance = distance[current]

      possible_words(current).each do |word|
        next if distance[word]

        distance[word] = current_distance + 1
        if word == @finish
          return distance[word] + 1
        end

        queue << word
      end
    end

    0
  end

  def possible_words(word)
    res = []
    for i in 0..word.size - 1
      original_char = word[i]
      ('a'..'z').each do |ch|
        next if ch == original_char

        new_word = word.dup
        new_word[i] = ch

        next unless @word_list.include?(new_word)
        res << new_word
      end
    end

    res
  end
end
