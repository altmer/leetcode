class WordBreak
  attr_reader :str, :dict
  def initialize(str, dict)
    @str = str
    @dict = {}
    dict.each do |word|
      @dict[word] = true
    end
  end

  def perform
    path = Array.new(str.size + 1, false)
    path[0] = true

    (1..str.size).each do |pos|
      next unless path[pos - 1]
      (pos..str.size).each do |ending|
        slice = str[pos-1..ending-1]
        if @dict[slice]
          path[ending] = true
        end
      end
    end

    path[str.size]
  end
end
