module G5FoundationClient::RspecHelpers
  def stub_location_for_uid(uid, location = nil)
    location ||= FactoryGirl.build(:g5_location)

    G5FoundationClient::Location.
      stub(:find_by_uid).
      with(uid).
      and_return(location)

    location
  end

  def stub_client_for_uid(uid, client = nil)
    client ||= FactoryGirl.build(:g5_client)

    G5FoundationClient::Client.
      stub(:find_by_uid).
      with(uid).
      and_return(client)

    client
  end
end

RSpec.configure do |config|
  config.include G5FoundationClient::RspecHelpers
end

if defined?(FactoryGirl)
  require 'g5_foundation_client/rspec/factories'
end
