require 'spec_helper'

describe G5FoundationClient::Client do
  before { G5FoundationClient.access_token = "token" }

  describe "instantiating with a hash" do
    subject do
      G5FoundationClient::Client.new(
        uid: "http://example.com/urn",
        urn: "urn",
        name: "Test Name",
        vertical: "Senior",
        domain: "example.com",
        domain_type: "MultiDomainClient"
      )
    end

    its(:uid) { should eql("http://example.com/urn") }
    its(:urn) { should eql("urn") }
    its(:name) { should eql("Test Name") }
    its(:vertical) { should eql("Senior") }
    its(:domain) { should eql("example.com") }
    its(:domain_type) { should eql("MultiDomainClient") }
  end

  describe ".find_by_uid" do
    let(:uid) { "http://example.com/clients/g5-c-1234-client" }
    let(:response) { fixture("client_detail.html") }
    before { stub_json(uid + "?access_token=token", response) }
    subject(:find) { G5FoundationClient::Client.find_by_uid(uid) }

    its(:name) { should eq("Test Client") }
  end
end
