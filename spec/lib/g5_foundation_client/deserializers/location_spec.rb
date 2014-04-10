require 'spec_helper'

describe G5FoundationClient::Deserializers::Location do
  describe ".from_markup" do
    let(:markup) { fixture("location_detail.html") }
    subject { G5FoundationClient::Deserializers::Location.from_markup(markup) }

    its(:uid) { should eq("http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location") }
    its(:name) { should eq("Test Location") }
    its(:phone) { should eq("123-123-1234") }
    its(:ga_tracking_id) { should eq("UA-1234-1") }
    its(:ga_profile_id) { should eq("ga:1234") }
  end
end
