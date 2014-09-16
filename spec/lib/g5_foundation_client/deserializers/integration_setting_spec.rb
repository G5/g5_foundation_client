require 'spec_helper'

describe G5FoundationClient::Deserializers::IntegrationSetting do
  describe '.from_markup' do
    subject { G5FoundationClient::Deserializers::Location.from_markup(markup).integration_setting }

    context 'with many fields provided' do
      let(:markup) { fixture('location_detail.html') }

      its(:inventory_service_url) { should eq('http://myservice.com') }
      its(:etl_strategy_name) { should eq('centershift') }
      its(:vendor_endpoint) { should eq('http://centershift.example.com') }
      its(:vendor_user_name) { should eq('vun') }
      its(:vendor_password) { should eq('vpw') }
      its(:custom_integration_settings) { should eq({channel: '6'}) }
    end
  end
end
