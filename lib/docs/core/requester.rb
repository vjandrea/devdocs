require 'typhoeus'

module Docs
  class Requester < Typhoeus::Hydra
    attr_reader :request_options

    def self.run(url, options = {}, &block)
      requester = new(options)
      requester.on_response(&block) if block
      requester.request(url)
      requester.run
      requester
    end

    def initialize(options = {})
      @request_options = options.extract!(:request_options)[:request_options].try(:dup) || {}
      options[:max_concurrency] ||= 5
      super
    end

    def request(url, options = {}, &block)
      request = Request.new(url, request_options.merge(options))
      request.on_complete(&block) if block
      queue(request)
      request
    end

    def queue(request)
      request.on_complete(&method(:handle_response))
      super
    end

    def on_response(&block)
      @on_response ||= []
      @on_response << block if block
      @on_response
    end

    private

    def handle_response(response)
      on_response.each do |callback|
        result = callback.call(response)
        result.each { |url| request(url) } if result.is_a? Array
      end
    end
  end
end