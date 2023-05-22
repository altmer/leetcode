class StringCompression
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def perform
    return 0 if data.nil? || data.empty?

    res_pointer = 0
    index = 0
    current_char = data[0]
    current_count = 0

    while index <= data.size
      if index == data.size || data[index] != current_char
        data[res_pointer] = current_char
        res_pointer += 1

        if current_count != 1
          digits = current_count.to_s.split("")
          digits.each do |digit|
            data[res_pointer] = digit
            res_pointer += 1
          end
        end

        current_char = data[index] if index < data.length
        current_count = 1
      else
        current_count += 1
      end

      index += 1
    end

    res_pointer
  end
end
