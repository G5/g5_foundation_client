require 'spec_helper'

describe G5FoundationClient::Deserializers::Location do
  describe ".from_markup" do
    subject { G5FoundationClient::Deserializers::Location.from_markup(markup) }

    context "with many fields provided" do
      let(:markup) { fixture("location_detail.html") }

      its(:uid) { should eq("http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location") }
      its(:urn) { should eq("g5-cl-1234-location") }
      its(:name) { should eq("Test Location") }
      its(:phone) { should eq("123-123-1234") }
      its(:domain) { should eq("http://example.com/") }
      its(:corporate) { should be_true }
      its(:floor_plans) { should eq("1, 2, 3, studio apartments") }
      its(:primary_amenity) { should eq("Stainless Steel Appliances") }
      its(:qualifier) { should eq("Luxury") }
      its(:primary_landmark) { should eq("Venture Marina") }
      its(:ga_tracking_id) { should eq("UA-1234-1") }
      its(:ga_profile_id) { should eq("ga:1234") }
      its(:neighborhood) { should eq("West") }
      its(:street_address) { should eq("123 Test Way") }
      its(:locality) { should eq("Testville") }
      its(:region) { should eq("TK") }
      its(:postal_code) { should eq("31324") }
    end

    context "missing many fields" do
      let(:markup) { fixture("empty_hcard.html") }
      its(:uid) { should be_nil }
    end
  end
end
