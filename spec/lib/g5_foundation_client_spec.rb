require 'spec_helper'

describe G5FoundationClient do
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
