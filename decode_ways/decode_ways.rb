class DecodeWays
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def perform
    dp = Array.new(data.size + 1, 0)
    dp[0] = 1

    (1..data.size).each do |i|
      # check one digit number
      cur = i - 1
      if data[cur] != '0'
        dp[i] += dp[i-1]
      end

      # check two digit number
      if cur - 1 >= 0 && valid_two_digits?(data[cur-1], data[cur])
        dp[i] += dp[i-2]
      end
    end

    dp[data.size]
  end

  private

  def valid_two_digits?(first, second)
    (first == '1') || (first == '2' && second >= '0' && second <= '6')
  end
end
