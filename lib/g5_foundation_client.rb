require 'active_support/core_ext/hash'
require 'httparty'
require 'g5_authentication_client'
require 'g5_foundation_client/version'

module G5FoundationClient
  def self.access_token=(token)
    @access_token = token
  end

  def self.access_token
    @access_token ||= G5AuthenticationClient::Client.new.get_access_token
  end
end

require 'g5_foundation_client/error'
require 'g5_foundation_client/record_not_found_exception'
require 'g5_foundation_client/fetcher'

require 'g5_foundation_client/models/findable_by_uid'
require 'g5_foundation_client/models/amenity'
require 'g5_foundation_client/models/location'
require 'g5_foundation_client/models/client'


