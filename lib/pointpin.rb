require 'pointpin/configuration'
require 'pointpin/version'

require 'hashie'
require 'multi_json'
require 'faraday'

module Pointpin
  extend Configuration

  self.default_params = {}

  class << self
    def locate(ip)
      pointpin_url = "#{ Pointpin.api_endpoint }/#{ Pointpin.api_key }/json/#{ ip }"

      pointpin_response = get(pointpin_url)

      if pointpin_response.success?
        return Hashie::Mash.new(MultiJson.load(pointpin_response.body))
      end
    end
    
    def connection
      @connection ||= Faraday.new
    end
    
    def connection=(connection)
      @connection = connection
    end

    private

    def get(path, params = {})
      params = Pointpin.default_params.merge(params || {})

      connection.get(path, params)
    end
  end
end