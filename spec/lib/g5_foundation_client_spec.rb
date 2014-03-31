require 'spec_helper'

describe G5FoundationClient do
  describe ".endpoint_host" do
    subject(:endpoint_host) { G5FoundationClient.endpoint_host }

    context "when it has not been set" do
      it "explodes violently" do
        expect { endpoint_host }.to raise_error(/endpoint_host/)
      end
    end

    context "when it has been set" do
      before { G5FoundationClient.endpoint_host = "example.com" }
      it { should eq("example.com") }
    end
  end

  describe ".access_token" do
    subject { G5FoundationClient.access_token }

    context "when it has not been set" do
      before do
        G5AuthenticationClient::Client.stub_chain(
          :new,
          get_access_token: "fetched access token"
        )
      end

      it { should eql("fetched access token") }
    end

    context "when it has beeen set" do
      before { G5FoundationClient.access_token = "set access token" }
      it { should eql("set access token") }
    end
  end
end
