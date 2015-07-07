class Interview1

  def parse(hash)
    array = Array.new
    hash.each do |key, value|
      if key.kind_of?(Fixnum)
        array << key.to_s
      else
        array << key
      end
    end
    sort_result(array)
  end


  private

  def sort_result(input)
    input.sort! do |x,y|
      y.size <=> x.size
    end
    return_fixnums(input)
  end

  def return_fixnums(input)
    array = Array.new
    input.each do |str|
      if str.kind_of?(Symbol)
        array << str
      elsif is_integer?(str)
        array << str.to_i
      else
        array << str
      end
    end
    array
  end

  def is_integer?(str)
    result = str.split('').select do |char|
      /\d/.match(char)
    end
    if result.size == str.size
      true
    else
      false
    end
  end
end
