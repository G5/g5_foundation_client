require 'spec_helper'

describe G5FoundationClient::Deserializers::IntegrationSetting do
  describe '.from_markup' do
    subject { G5FoundationClient::Deserializers::Location.from_markup(markup).integration_setting }

    context 'with many fields provided' do
      let(:markup) { fixture('location_detail.html') }

      its(:inventory_service_url) { should eq('http://localhost:5777/api/v1/storage_facilities') }
      its(:inventory_service_auth_token) { should eq('authtoken') }
      its(:etl_strategy_name) { should eq('EtlStrategies::Centershift4') }
      its(:inventory_vendor_endpoint) { should eq('https://slc.centershift.com/sandbox40/SWS.asmx?WSDL') }
      its(:inventory_vendor_user_name) { should eq('G-5TSite') }
      its(:inventory_vendor_password) { should eq('1qaz@Wsx') }
      its(:lead_strategy_name) { should eq('LeadStrategies::SiteLink') }
      its(:lead_vendor_endpoint) { should eq('https://www.smdservers.net/CCWs_3.5/CallCenterWs.asmx?WSDL') }
      its(:lead_vendor_user_name) { should eq('Administrator') }
      its(:lead_vendor_password) { should eq('Demo') }
      its(:custom_integration_settings) { should eq({corporate_code: '1000000129', location_code: '1000000678', channel: '2'}) }
    end
  end
end
