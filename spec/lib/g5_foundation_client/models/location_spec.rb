require 'spec_helper'

describe G5FoundationClient::Location do
  before { G5FoundationClient.access_token = "token" }

  describe "instantiating with a hash" do
    subject do
      G5FoundationClient::Location.new(
        uid: "http://example.com/uid",
        name: "Test Name",
        phone: "123-123-1234",
        ga_tracking_id: "UA-1234-5",
        ga_profile_id: "ga:1234"
      )
    end

    its(:uid) { should eql("http://example.com/uid") }
    its(:name) { should eql("Test Name") }
    its(:phone) { should eql("123-123-1234") }
    its(:ga_tracking_id) { should eql("UA-1234-5") }
    its(:ga_profile_id) { should eql("ga:1234") }
  end

  describe ".find_by_uid" do
    let(:uid) do
      "http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location"
    end
    let(:response) { fixture("location_detail.html") }
    before { stub_json(uid + "?access_token=token", response) }
    subject(:find) { G5FoundationClient::Location.find_by_uid(uid) }

    its(:name) { should eq("Test Location") }
  end
end
