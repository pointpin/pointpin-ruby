require 'spec_helper'

describe Pointpin do
  describe '.default_params' do
    it "defaults to an empty hash" do
      Pointpin.default_params.should == {}
    end
  end

  describe '.locate' do
    before :each do
      Pointpin.api_key = 'this-is-a-valid-api-key'
    end

    it 'should return a location for a given IP address' do
      VCR.use_cassette('location_for_ip', record: :once) do
        location = Pointpin.locate('55.111.555.555')
        location.should_not be_nil
        location.latitude.should == 53.3331
        location.longitude.should == -6.2489
      end
    end

    context 'unit tests' do
      let(:faraday)  { double 'Faraday', get: response }
      let(:response) { double 'Response', success?: true, body: '{}' }

      before :each do
        stub_const 'Faraday', double(new: faraday)

        Pointpin.stub(api_key: 'api-key', connection: faraday)
      end

      context 'without default parameters' do
        before :each do
          Pointpin.stub(default_params: {})
        end

        it "sends a standard request" do
          faraday.should_receive(:get).with(
            'http://geo.pointp.in/api-key/json/1.2.3.4', {}
          ).and_return(response)

          Pointpin.locate('1.2.3.4')
        end
      end
    end
  end
end