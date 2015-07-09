require 'spec_helper'

describe HashParser do

  context '#parse should return an array with hash keys sorted min to max' do

    it 'should return a hash object' do
      hash = HashParser.new({'this' => :is, :a => 'test', 'of' => 'the', :hash => 'parser' })
      sorted_hash = {"this"=>:is, :hash=>"parser", "of"=>"the", :a=>"test"}
      expect(hash.parse).to eq sorted_hash
      expect(hash.parse.class).to eq Hash
    end

    it 'should sort hashes with keys of strings only' do
      hash = HashParser.new({ "hello" => 1, "hi" => 2, "BryanFinlayson" => :blah})
      new_hash = { "BryanFinlayson" => :blah, "hello" => 1, "hi" => 2 }
      expect(hash.parse).to eq new_hash
    end

    it 'should sort hashes with keys that include fixnums and strings' do
      hash = HashParser.new({ "hello" => 1, "hi" => 2, 354 => :blah})
      sorted_hash = { 'hello' => 1, 354 => :blah, 'hi' => 2 }
      expect(hash.parse).to eq sorted_hash
    end

    it 'should sort hashes with keys that include just fixnums' do
      hash = HashParser.new({ 3 => 1, 1040 => 2, 354 => :blah})
      sorted_hash = { 1040 => 2, 354 => :blah, 3 => 1 }
      expect(hash.parse).to eq sorted_hash
    end

    it 'should sort hashes with keys that that have strings with numbers mixed in' do
      hash = HashParser.new({ "he555llo" => 1, "h4i" => 2, 3564 => :blah})
      sorted_hash = { 'he555llo' => 1, 3564 => :blah, 'h4i' => 2 }
      expect(hash.parse).to eq sorted_hash
    end

    it 'should sort hashes with symbols' do
      hash = HashParser.new({ :finlayson => 1, :bryan => 2, :andrew => :blah})
      sorted_hash = { :finlayson => 1, :andrew => :blah, :bryan => 2 }
      expect(hash.parse).to eq sorted_hash
    end

    it 'should sort hashes with a mix of fixnums, strings, and symbols' do
      hash = HashParser.new({ :finlayson => 1, 1984 => :blah, "this is my string" => :blah})
      sorted_hash = { "this is my string" => :blah, :finlayson => 1, 1984 => :blah }
      expect(hash.parse).to eq sorted_hash
    end
  end
end
