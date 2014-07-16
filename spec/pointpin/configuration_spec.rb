require 'spec_helper'

describe Pointpin::Configuration do
  describe '.configure' do
    it 'should have default attributes' do
      Pointpin.configure do |configuration|
        configuration.api_endpoint.should eql(Pointpin::Configuration::DEFAULT_API_ENDPOINT)
        configuration.api_key.should be_nil
      end
    end
  end
end