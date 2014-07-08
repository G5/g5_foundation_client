require 'spec_helper'

describe G5FoundationClient::Deserializers::Client do
  describe ".from_markup" do
    subject { G5FoundationClient::Deserializers::Client.from_markup(markup) }

    context "with many fields provided" do
      let(:markup) { fixture("client_detail.html") }

      its(:uid) { should eq("http://example.com/clients/g5-c-1234-client") }
      its(:urn) { should eq("g5-c-1234-client") }
      its(:name) { should eq("Test Client") }
      its(:vertical) { should eq("Apartments") }
      its(:domain) { should eq("http://example.com/") }
      its(:domain_type) { should eq("MultiDomainClient") }
    end

    context "missing many fields" do
      let(:markup) { fixture("empty_hcard.html") }
      its(:uid) { should be_nil }
    end
  end
end
