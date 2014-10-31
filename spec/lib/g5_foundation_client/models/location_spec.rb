require 'spec_helper'

describe G5FoundationClient::Location do
  before { G5FoundationClient.access_token = "token" }

  describe "instantiating with a hash" do
    let(:client) { G5FoundationClient::Client.new(uid: 'myclient') }
    subject do
      G5FoundationClient::Location.new(
          uid:                 "http://example.com/urn",
          urn:                 "urn",
          client:              client,
          client_uid:          "http://example.com/client_uid",
          name:                "Test Name",
          phone_number:        "123-123-1234",
          domain:              "example.com",
          corporate:           "true",
          floor_plans:         "Apartments",
          apartment_amenity_1: "Pony Rides",
          landmark_1_name:     "An enormous bust of Brett Favre",
          ga_tracking_id:      "UA-1234-5",
          ga_profile_id:       "ga:1234",
          neighborhood:        "Wrong side of the tracks",
          street_address_1:    "123 Test Way",
          street_address_2:    "apt 2",
          state:               "South Testakota",
          city:                "Testville",
          postal_code:         "31337",
          status:              "Pending",
          client:              client
      )
    end

    its(:client) { should eql(client) }
    its(:uid) { should eql("http://example.com/urn") }
    its(:urn) { should eql("urn") }
    its(:client_uid) { should eql("http://example.com/client_uid") }
    its(:name) { should eql("Test Name") }
    its(:phone_number) { should eql("123-123-1234") }
    its(:domain) { should eql("example.com") }
    its(:corporate) { should be_true }
    its(:floor_plans) { should eql("Apartments") }
    its(:primary_amenity) { should eql("Pony Rides") }
    its(:primary_landmark) { should eql("An enormous bust of Brett Favre") }
    its(:ga_tracking_id) { should eql("UA-1234-5") }
    its(:ga_profile_id) { should eql("ga:1234") }
    its(:neighborhood) { should eql("Wrong side of the tracks") }
    its(:street_address) { should eql("123 Test Way\napt 2") }
    its(:region) { should eql("South Testakota") }
    its(:locality) { should eql("Testville") }
    its(:postal_code) { should eql("31337") }
    its(:status) { should eql("Pending") }
    its(:inventory_integration_settings) { should be_nil }
    its(:lead_integration_settings) { should be_nil }

    it 'deletes client from hash' do
      expect(subject.location_hash[:client]).to be_nil
    end
  end

  describe '.find_by_uid' do
    let(:uid) do
      'http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location'
    end
    let(:response) { fixture('hub-location.json') }
    before { stub_json(uid + '?access_token=token', response) }
    subject(:find) { G5FoundationClient::Location.find_by_uid(uid) }

    its(:name) { should eq('brussels') }
    it 'has inventory integration settings' do
      subject.inventory_integration_settings.integration_setting_hash[:strategy_name].should eq('vsn')
    end
  end
end
