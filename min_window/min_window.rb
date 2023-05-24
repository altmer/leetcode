class MinWindow
  attr_reader :str, :template
  def initialize(s, t)
    @str = s
    @data = Hash.new { |h, k| h[k] = 0 }
    t.split("").each do |ch|
      @data[ch] += 1
    end
    @letters_count = @data.keys.count
  end

  def perform
    freq = Hash.new { |h, k| h[k] = 0 }
    formed = 0

    start = 0
    window = []

    (0..str.size - 1).each do |i|
      ch = str[i]
      next unless @data.key?(ch)

      freq[ch] += 1
      formed += 1 if freq[ch] == @data[ch]

      loop do
        start_char = str[start]
        break if @data.key?(start_char) && freq[start_char] <= @data[start_char]

        freq[start_char] -= 1
        start += 1
      end

      next unless formed == @letters_count

      window = if window.empty?
        [start, i]
      else
        current_length = i - start
        length_before = window.last - window.first
        window = if current_length < length_before
          [start, i]
        else
          window
        end
      end
    end

    return "" if window.empty?
    str[window.first..window.last]
  end
end
