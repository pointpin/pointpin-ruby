require 'spec_helper'

describe 'Pointpin::VERSION' do
  it 'should be the correct version' do
    Pointpin::VERSION.should == '1.0.0'
  end
end