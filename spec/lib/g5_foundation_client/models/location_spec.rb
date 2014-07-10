require 'spec_helper'

describe G5FoundationClient::Location do
  before { G5FoundationClient.access_token = "token" }

  describe "instantiating with a hash" do
    subject do
      G5FoundationClient::Location.new(
        uid: "http://example.com/urn",
        urn: "urn",
        client_uid: "http://example.com/client_uid",
        name: "Test Name",
        phone: "123-123-1234",
        domain: "example.com",
        corporate: "true",
        floor_plans: "Apartments",
        primary_amenity: "Pony Rides",
        primary_landmark: "An enormous bust of Brett Favre",
        qualifier: "I have no idea what a qualifier is",
        ga_tracking_id: "UA-1234-5",
        ga_profile_id: "ga:1234",
        neighborhood: "Wrong side of the tracks",
        street_address: "123 Test Way",
        region: "South Testakota",
        locality: "Testville",
        postal_code: "31337"
      )
    end

    its(:uid) { should eql("http://example.com/urn") }
    its(:urn) { should eql("urn") }
    its(:client_uid) { should eql("http://example.com/client_uid") }
    its(:name) { should eql("Test Name") }
    its(:phone) { should eql("123-123-1234") }
    its(:domain) { should eql("example.com") }
    its(:corporate) { should be_true }
    its(:floor_plans) { should eql("Apartments") }
    its(:primary_amenity) { should eql("Pony Rides") }
    its(:primary_landmark) { should eql("An enormous bust of Brett Favre") }
    its(:qualifier) { should eql("I have no idea what a qualifier is") }
    its(:ga_tracking_id) { should eql("UA-1234-5") }
    its(:ga_profile_id) { should eql("ga:1234") }
    its(:neighborhood) { should eql("Wrong side of the tracks") }
    its(:street_address) { should eql("123 Test Way") }
    its(:region) { should eql("South Testakota") }
    its(:locality) { should eql("Testville") }
    its(:postal_code) { should eql("31337") }
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
