require 'spec_helper'

describe G5FoundationClient::IntegrationSetting do
  before { G5FoundationClient.access_token = 'token' }

  describe 'instantiating with a hash' do
    let(:job_frequency_in_minutes) { 60 }
    let(:service_url) { 'http://inventory.service.example.com' }
    let(:location) { 'location' }
    let(:strategy_name) { 'Centershift' }
    let(:vendor_endpoint) { 'http://centershift.example.com' }
    let(:vendor_user_name) { 'uname' }
    let(:vendor_password) { 'pw' }
    let(:vendor_action) { 'inventory' }
    let(:custom_integration_settings) { {foo: 'bar'} }
    let(:init_hash) { {service_url:              service_url,
                       location:                 location,
                       job_frequency_in_minutes: job_frequency_in_minutes,
                       strategy_name:            strategy_name,
                       vendor_endpoint:          vendor_endpoint,
                       vendor_user_name:         vendor_user_name,
                       vendor_password:          vendor_password,
                       vendor_action:            'inventory'
    } }

    subject { G5FoundationClient::IntegrationSetting.new(init_hash) }

    its(:job_frequency_in_minutes) { should eql(job_frequency_in_minutes) }
    its(:location) { should eql(location) }
    its(:vendor_action) { should eql(vendor_action) }
    its(:vendor_endpoint) { should eql(vendor_endpoint) }
    its(:vendor_user_name) { should eql(vendor_user_name) }
    its(:vendor_password) { should eql(vendor_password) }
    its(:strategy_name) { should eql(strategy_name) }
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
