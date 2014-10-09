require 'spec_helper'

describe G5FoundationClient::IntegrationSetting do
  before { G5FoundationClient.access_token = 'token' }

  describe 'instantiating with a hash' do
    let(:inventory_service_url) { 'http://inventory.service.example.com' }
    let(:location) { 'location' }
    let(:etl_strategy_name) { 'Centershift' }
    let(:inventory_vendor_endpoint) { 'http://centershift.example.com' }
    let(:inventory_vendor_user_name) { 'uname' }
    let(:inventory_vendor_password) { 'pw' }
    let(:lead_strategy_name) { 'sitelink' }
    let(:lead_vendor_endpoint) { 'http://sitelink.example.com' }
    let(:lead_vendor_user_name) { 'sluname' }
    let(:lead_vendor_password) { 'slpw' }
    let(:custom_integration_settings) { {foo: 'bar'} }
    let(:init_hash) { {inventory_service_url:      inventory_service_url,
                       location:                   location,
                       etl_strategy_name:          etl_strategy_name,
                       inventory_vendor_endpoint:  inventory_vendor_endpoint,
                       inventory_vendor_user_name: inventory_vendor_user_name,
                       inventory_vendor_password:  inventory_vendor_password,
                       lead_strategy_name:         lead_strategy_name,
                       lead_vendor_endpoint:       lead_vendor_endpoint,
                       lead_vendor_user_name:      lead_vendor_user_name,
                       lead_vendor_password:       lead_vendor_password,
                       vendor_action:              'inventory'
    } }

    subject { G5FoundationClient::IntegrationSetting.new(init_hash) }

    its(:location) { should eql(location) }
    its(:to_settings_hash) { should eq(init_hash) }
    its(:inventory?) { should be_true }
    its(:lead?) { should be_false }
  end

  describe 'vendor actions' do
    context 'inventory' do
      subject { G5FoundationClient::IntegrationSetting.new(vendor_action: 'inventory') }
      its(:inventory?) { should be_true }
      its(:lead?) { should be_false }
    end

    context 'lead' do
      subject { G5FoundationClient::IntegrationSetting.new(vendor_action: 'lead') }
      its(:inventory?) { should be_false }
      its(:lead?) { should be_true }
    end
  end
end
