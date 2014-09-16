require 'spec_helper'

describe G5FoundationClient::IntegrationSetting do
  before { G5FoundationClient.access_token = 'token' }

  describe 'instantiating with a hash' do
    let(:inventory_service_url) { 'http://inventory.service.example.com' }
    let(:etl_strategy_name) { 'Centershift' }
    let(:vendor_endpoint) { 'http://centershift.example.com' }
    let(:vendor_user_name) { 'uname' }
    let(:vendor_password) { 'pw' }
    let(:custom_integration_settings) { {foo: 'bar'} }
    let(:init_hash) { {inventory_service_url:       inventory_service_url,
                       etl_strategy_name:           etl_strategy_name,
                       vendor_endpoint:             vendor_endpoint,
                       vendor_user_name:            vendor_user_name,
                       vendor_password:             vendor_password,
                       custom_integration_settings: custom_integration_settings} }
    let(:expected_to_settings_hash) do
      expected = init_hash.clone
      custom   = expected.delete(:custom_integration_settings)
      expected.merge(custom)
    end
    subject { G5FoundationClient::IntegrationSetting.new(init_hash) }

    its(:inventory_service_url) { should eql(inventory_service_url) }
    its(:etl_strategy_name) { should eql(etl_strategy_name) }
    its(:vendor_endpoint) { should eql(vendor_endpoint) }
    its(:vendor_user_name) { should eql(vendor_user_name) }
    its(:vendor_password) { should eql(vendor_password) }
    its(:custom_integration_settings) { should eql(custom_integration_settings) }
    its(:to_settings_hash) { should eq(expected_to_settings_hash) }
  end
end
