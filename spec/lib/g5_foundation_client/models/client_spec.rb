require 'spec_helper'

describe G5FoundationClient::Client do
  before { G5FoundationClient.access_token = "token" }

  describe "instantiating with a hash" do
    subject do
      G5FoundationClient::Client.new(
          uid:         "http://example.com/urn",
          urn:         "urn",
          name:        "Test Name",
          vertical:    "Senior",
          domain:      "example.com",
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

  describe "instantiating with nested hash of Locations" do
    subject(:client) { G5FoundationClient::Client.new(attributes) }

    context "when the nested parameters are correct" do
      let(:attributes) do
        {
            name:      "Client Name",
            locations: [
                           {name: "Location 1"},
                           {name: "Location 2"}
                       ]
        }
      end

      its(:name) { should eq("Client Name") }

      it "instantiates associated Locations" do
        expect(client.locations.length).to eq(2)
        expect(client.locations.all? { |l| l.is_a?(G5FoundationClient::Location) }).to be_true
        expect(client.locations.map(&:name)).to eq(['Location 1', 'Location 2'])
      end
    end
  end

  describe :all_client_uids do
    let(:clients_url) { 'http://the-hub-clients-url' }
    let(:response) { fixture('hub-clients.json') }
    before { stub_json(clients_url + '?access_token=token', response) }
    subject(:all_client_uids) { G5FoundationClient::Client.all_client_uids(clients_url) }
    let(:expected) do
      %w(http://hub.g5dxm.com/clients/g5-c-1sshwrc5-chateau-retirement-communities-llc http://hub.g5dxm.com/clients/g5-c-1skckws2-case-and-associates-properties-inc http://hub.g5dxm.com/clients/g5-c-1sjhz1kl-holland-residential http://hub.g5dxm.com/clients/g5-c-1szcnbet-berkshire-communities http://hub.g5dxm.com/clients/g5-c-1soj8z7v-g5-selfstorage http://hub.g5dxm.com/clients/g5-c-1suhzvye-demo-client-senior-living http://hub.g5dxm.com/clients/g5-c-1t08o5vy-default-yaml-test http://hub.g5dxm.com/clients/g5-c-1szs3551-passco-companies-llc http://hub.g5dxm.com/clients/g5-c-1sze0wlk-legacy-ptla http://hub.g5dxm.com/clients/g5-c-1szn2ho0-spinup-test-4 http://hub.g5dxm.com/clients/g5-c-1stn8mua-blue-ridge-companies http://hub.g5dxm.com/clients/g5-c-1soj8m6e-g5-multifamily http://hub.g5dxm.com/clients/g5-c-1szcsfqz-animal-farm http://hub.g5dxm.com/clients/g5-c-6d4gqkl-demo http://hub.g5dxm.com/clients/g5-c-1skmeepf-clowns-monkeys-jokers http://hub.g5dxm.com/clients/g5-c-1slhp2tc-compass-rock-real-estate http://hub.g5dxm.com/clients/g5-c-1svnc06g-deploy-test http://hub.g5dxm.com/clients/g5-c-1sve69nj-brian-url-test http://hub.g5dxm.com/clients/g5-c-1su8sbx5-brian-reader-test http://hub.g5dxm.com/clients/g5-c-1su76sgw-brian-test-cms http://hub.g5dxm.com/clients/g5-c-1strrmif-cke-properties http://hub.g5dxm.com/clients/g5-c-1sojmghc-g5-multifamily2 http://hub.g5dxm.com/clients/g5-c-1so8p6u9-mj-storage http://hub.g5dxm.com/clients/g5-c-1sbdk8wp-bb-self-storage http://hub.g5dxm.com/clients/g5-c-1sf7t8z8-jls-single-domain-client http://hub.g5dxm.com/clients/g5-c-1servrzr-luxe-apartment-company http://hub.g5dxm.com/clients/g5-c-6d4u4sc-madrona http://hub.g5dxm.com/clients/g5-c-1sbmayxa-bb-properties http://hub.g5dxm.com/clients/g5-c-1s9v57wo-jls-inc http://hub.g5dxm.com/clients/g5-c-1s3t3hh2-omni-consumer-products)
    end
    it 'returns client_uids' do
      expect(subject.sort).to eq(expected.sort)
    end
  end

  describe ".find_by_uid" do
    let(:uid) { 'http://example.com/clients/g5-c-1234-client' }
    let(:response) { fixture('hub-client.json') }
    before { stub_json(uid + '?access_token=token', response) }
    subject(:find) { G5FoundationClient::Client.find_by_uid(uid) }

    its(:name) { should eq('no store') }
  end
end
