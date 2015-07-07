require 'spec_helper'

describe HashParser do

  context '#parse should return an array with hash keys sorted min to max' do
    it 'should sort hashes with keys of strings only' do
      hash = HashParser.new
      expect(hash.parse({ "hello" => 1, "hi" => 2, "BryanFinlayson" => :blah})).to eq ['BryanFinlayson', 'hello', 'hi']
    end

    it 'should sort hashes with keys that include fixnums and strings' do
      hash = HashParser.new
      expect(hash.parse({ "hello" => 1, "hi" => 2, 354 => :blah})).to eq ['hello', 354, 'hi']
    end

    it 'should sort hashes with keys that include just fixnums' do
      hash = HashParser.new
      expect(hash.parse({ 3 => 1, 1040 => 2, 354 => :blah})).to eq [1040, 354, 3]
    end

    it 'should sort hashes with keys that that have strings with numbers mixed in' do
      hash = HashParser.new
      expect(hash.parse({ "he555llo" => 1, "h4i" => 2, 3564 => :blah})).to eq ['he555llo', 3564, 'h4i']
    end

    it 'should sort hashes with symbols' do
      hash = HashParser.new
      expect(hash.parse({ :finlayson => 1, :bryan => 2, :andrew => :blah})).to eq [:finlayson, :andrew, :bryan]
    end

    it 'should sort hashes with a mix of fixnums, strings, and symbols' do
      hash = HashParser.new
      expect(hash.parse({ :finlayson => 1, 1984 => :blah, "this is my string" => :blah})).to eq ["this is my string", :finlayson, 1984]
    end

  end
end
