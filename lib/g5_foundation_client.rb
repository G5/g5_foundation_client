require "virtus"
require "httparty"
require "microformats2"
require "g5_authentication_client"
require "g5_foundation_client/version"

module G5FoundationClient
  def self.access_token=(token)
    @access_token = token
  end

  def self.access_token
    @access_token ||= G5AuthenticationClient::Client.new.get_access_token
  end

  class RecordNotFoundException < Exception
  end
end

require 'g5_foundation_client/fetcher'

require 'g5_foundation_client/models/location'
require 'g5_foundation_client/models/client'

require 'g5_foundation_client/deserializers/safe_access'
require 'g5_foundation_client/deserializers/location'
require 'g5_foundation_client/deserializers/client'
