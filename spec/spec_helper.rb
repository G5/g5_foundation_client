require 'g5_foundation_client'

require 'pry'
require 'rspec/its'
require 'webmock/rspec'

module Webmockery
  def stub_json(url, response, status=200)
    stub_request(
      :get,
      url
    ).to_return(
      body: response,
      status: status,
      headers: {
        content_type: 'application/json'
      }
    )
  end

  def stub_post(url, response, data, status=200)
    stub_request(
      :post,
      url
    ).with(
      body: data
    ).to_return(
      body: response,
      status: status,
      headers: {
        content_type: 'application/json'
      }
    )
  end
end

module FixturesHelper
  def fixture(fixture_path)
    open(File.join("spec", "fixtures", fixture_path)).read
  end
end

RSpec.configure do |config|
  config.include Webmockery
  config.include FixturesHelper
  config.after { G5FoundationClient.access_token = nil }
end
