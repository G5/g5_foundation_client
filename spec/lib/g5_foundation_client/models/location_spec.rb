require 'spec_helper'

describe G5FoundationClient::Location do
  before do
    G5FoundationClient.endpoint_host = "example.com"
    G5FoundationClient.access_token = "token"
  end

  describe "instantiating with a hash" do
    subject do
      G5FoundationClient::Location.new(
        uid: "http://example.com/uid",
        name: "Test Name",
        phone: "123-123-1234"
      )
    end

    its(:uid) { should eql("http://example.com/uid") }
    its(:name) { should eql("Test Name") }
    its(:phone) { should eql("123-123-1234") }
  end

  describe ".find_by_uid" do
    let(:uid) do
      "http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location"
    end
    let(:url) { "#{uid}?access_token=token" }
    subject(:find) do
      G5FoundationClient::Location.find_by_uid(uid)
    end

    context "when there is a Location at that UID" do
      before { stub_json(url, response) }
      let(:response) { fixture("location_detail.html") }

      its(:uid) { should eq(uid) }
      its(:name) { should eq("Test Location") }
      its(:phone) { should eq("123-123-1234") }
    end

    context "when there is no Location at that UID" do
      before { stub_json(url, response, 404) }
      let(:response) { %["<html><body>Something went wrong</body></html>] }

      it "explodes violently" do
        expect { find }.to raise_error(
          G5FoundationClient::RecordNotFoundException,
          /Location.+g5-cl-1234-location/
        )
      end
    end

    context "when there is an unexpected response" do
      before { stub_json(url, response, 418) }
      let(:response) { %[{"error":"I'm a teapot"}] }

      it "explodes violently" do
        expect { find }.to raise_error(/418/)
      end
    end
  end
end
