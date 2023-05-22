class StringCompression
  attr_reader :data, :to_delete
  def initialize(data, k)
    @data = data
    @to_delete = k
  end

  def perform
    return 0 if to_delete == data.size

    dp = Array.new(data.size + 1) { Array.new(to_delete + 1, data.size) }
    dp[0][0] = 0

    (1..data.size).each do |i|
      (0..[to_delete, i].min).each do |max_delete|
        # keep data[i-1]
        same_count = 0
        delete = 0

        i.downto(1) do |k|
          if data[k-1] == data[i-1]
            same_count += 1
          else
            delete += 1
          end

          digits = digits_length(same_count)

          break if max_delete - delete < 0

          dp[i][max_delete] = min(dp[i][max_delete], dp[k-1][max_delete - delete] + 1 + digits)
        end

        # delete data[i-1]
        if max_delete > 0
          dp[i][max_delete] = min(dp[i][max_delete], dp[i-1][max_delete-1])
        end
      end
    end

    dp[data.size][to_delete]
  end

  private

  def min(left, right)
    left < right ? left : right
  end

  def digits_length(n)
    if n == 1
      0
    elsif n < 10
      1
    elsif n < 100
      2
    else
      3
    end
  end
end
