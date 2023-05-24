class RegexMatch
  attr_reader :s, :p
  def initialize(s, p)
    @s = s
    @p = p
  end

  def perform
    @dp = Array.new(s.size) { Array.new(p.size, false) }
    is_match(s.size - 1, p.size - 1)
  end

  private

  def is_match(s_index, p_index)
    return true if s_index < 0 && p_index < 0

    # string has some characters but pattern is empty
    return false if s_index >= 0 && p_index < 0

    # pattern still has some charaters but string is empty
    if p_index >= 0 && s_index < 0
      # check that pattern has only chars with stars
      i = 0
      while i <= p_index
        if i + 1 <= p_index && p[i+1] == '*'
          i += 2
        else
          return false
        end
      end
      return true
    end

    return true if @dp[s_index][p_index]

    if s[s_index] == p[p_index] || p[p_index] == '.'
      return @dp[s_index][p_index] = is_match(s_index - 1, p_index - 1)
    end

    if p[p_index] == '*'
      res = is_match(s_index, p_index - 2)
      if p[p_index - 1] == '.' || p[p_index - 1] == s[s_index]
        res ||= is_match(s_index - 1, p_index)
      end
      return @dp[s_index][p_index] = res
    end

    return false
  end
end
