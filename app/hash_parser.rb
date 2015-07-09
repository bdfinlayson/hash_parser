class HashParser

  def initialize(hash)
    @hash = hash
  end

  def parse
    array = Array.new
    @hash.each_key do |key|
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
    sorted_keys = return_fixnums(input)
    assemble_hash(sorted_keys)
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

  def assemble_hash(array)
    hash = Hash.new
    array.each do |key|
      hash[key] = @hash[key]
    end
    hash
  end
end
