require 'spec_helper'

describe G5FoundationClient::IntegrationSetting do
  before { G5FoundationClient.access_token = 'token' }

  describe 'instantiating with a hash' do
    let(:inventory_service_url) { 'http://inventory.service.example.com' }
    let(:inventory_service_auth_token) { 'http://inventory.service.example.com' }
    let(:etl_strategy_name) { 'Centershift' }
    let(:inventory_vendor_endpoint) { 'http://centershift.example.com' }
    let(:inventory_vendor_user_name) { 'uname' }
    let(:inventory_vendor_password) { 'pw' }
    let(:lead_strategy_name) { 'sitelink' }
    let(:lead_vendor_endpoint) { 'http://sitelink.example.com' }
    let(:lead_vendor_user_name) { 'sluname' }
    let(:lead_vendor_password) { 'slpw' }
    let(:custom_integration_settings) { {foo: 'bar'} }
    let(:init_hash) { {inventory_service_url:        inventory_service_url,
                       inventory_service_auth_token: inventory_service_auth_token,
                       etl_strategy_name:            etl_strategy_name,
                       inventory_vendor_endpoint:    inventory_vendor_endpoint,
                       inventory_vendor_user_name:   inventory_vendor_user_name,
                       inventory_vendor_password:    inventory_vendor_password,
                       lead_strategy_name:           lead_strategy_name,
                       lead_vendor_endpoint:         lead_vendor_endpoint,
                       lead_vendor_user_name:        lead_vendor_user_name,
                       lead_vendor_password:         lead_vendor_password,
                       custom_integration_settings:  custom_integration_settings} }
    let(:expected_to_settings_hash) do
      expected = init_hash.clone
      custom   = expected.delete(:custom_integration_settings)
      expected.merge(custom)
    end
    subject { G5FoundationClient::IntegrationSetting.new(init_hash) }

    its(:inventory_service_url) { should eql(inventory_service_url) }
    its(:inventory_service_auth_token) { should eql(inventory_service_auth_token) }
    its(:etl_strategy_name) { should eql(etl_strategy_name) }
    its(:inventory_vendor_endpoint) { should eql(inventory_vendor_endpoint) }
    its(:inventory_vendor_user_name) { should eql(inventory_vendor_user_name) }
    its(:inventory_vendor_password) { should eql(inventory_vendor_password) }
    its(:lead_strategy_name) { should eql(lead_strategy_name) }
    its(:lead_vendor_endpoint) { should eql(lead_vendor_endpoint) }
    its(:lead_vendor_user_name) { should eql(lead_vendor_user_name) }
    its(:lead_vendor_password) { should eql(lead_vendor_password) }
    its(:custom_integration_settings) { should eql(custom_integration_settings) }
    its(:to_settings_hash) { should eq(expected_to_settings_hash) }
  end
end
