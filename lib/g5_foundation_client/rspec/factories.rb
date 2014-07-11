FactoryGirl.define do
  factory :g5_location, class: G5FoundationClient::Location do
    name "Test Location"
    phone_number "123-123-1234"
  end

  factory :g5_client, class: G5FoundationClient::Client do
    name "Test Client"
  end
end
