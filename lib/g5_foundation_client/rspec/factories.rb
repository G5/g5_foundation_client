FactoryGirl.define do
  factory :g5_location, class: G5FoundationClient::Location do
    hash_params { {uid: 'http://client.uid', name: 'metro', phone_number: '123-132-3333'} }
    initialize_with { new(hash_params) }
  end

  factory :g5_client, class: G5FoundationClient::Client do
    hash_params { {name: "Test Client"} }
    initialize_with { new(hash_params) }
  end
end
