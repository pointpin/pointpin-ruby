module Pointpin
  module Configuration
    # Default API endpoint
    DEFAULT_API_ENDPOINT = 'https://geo.pointp.in'

    # Pointpin API endpoint
    attr_writer :api_endpoint

    # API key
    attr_writer :api_key

    # Default parameters
    attr_accessor :default_params

    def configure
      yield self
    end

    # API endpoint
    def api_endpoint
      @api_endpoint ||= DEFAULT_API_ENDPOINT
    end

    # API key
    def api_key
      @api_key
    end
  end
end
