require 'spec_helper'

describe Interview1 do
  it 'should say hello' do
    interview = Interview1.new
    expect(interview.hello).to eq 'hello'
  end
end
