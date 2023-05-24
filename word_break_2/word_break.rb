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
    path = Array.new(str.size + 1) { [] }
    path[0] = [nil]

    (1..str.size).each do |pos|
      next if path[pos - 1].empty?
      (pos..str.size).each do |ending|
        slice = str[pos-1..ending-1]
        if @dict[slice]
          path[ending] << slice
        end
      end
    end

    reconstruct(path, str.size).map! do |arr|
      arr.compact.join(" ")
    end
  end

  private

  def reconstruct(path, index)
    result = []
    path[index].each do |word|
      unless word.nil?
        paths = reconstruct(path, index - word.size)

        paths.each do |arr|
          arr << word
          result << arr
        end
      else
        result << []
      end
    end

    result
  end
end
