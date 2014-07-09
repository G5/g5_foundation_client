require 'spec_helper'

describe G5FoundationClient::Deserializers::Client do
  describe ".from_markup" do
    subject(:client) { G5FoundationClient::Deserializers::Client.from_markup(markup) }

    context "with many fields provided" do
      let(:markup) { fixture("client_detail.html") }

      its(:uid) { should eq("http://example.com/clients/g5-c-1234-client") }
      its(:urn) { should eq("g5-c-1234-client") }
      its(:name) { should eq("Test Client") }
      its(:vertical) { should eq("Apartments") }
      its(:domain) { should eq("http://example.com/") }
      its(:domain_type) { should eq("MultiDomainClient") }

      describe "#locations" do
        it "instantiates associated Locations" do
          expect(client.locations.length).to eq(2)
          expect(client.locations.first.name).to eq("Test Location 1")
          expect(client.locations.first.uid).to eq("http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location")
        end
      end
    end

    context "missing many fields" do
      let(:markup) { fixture("empty_hcard.html") }
      its(:uid) { should be_nil }
    end
  end
end
