class G5FoundationClient::IntegrationSetting
  include Virtus.model

  def self.deserializer_class
    G5FoundationClient::Deserializers::IntegrationSetting
  end

  attribute :inventory_service_url, String
  attribute :inventory_service_auth_token, String
  attribute :etl_strategy_name, String
  attribute :inventory_vendor_endpoint, String
  attribute :inventory_vendor_user_name, String
  attribute :inventory_vendor_password, String
  attribute :lead_strategy_name, String
  attribute :lead_vendor_endpoint, String
  attribute :lead_vendor_user_name, String
  attribute :lead_vendor_password, String
  attribute :custom_integration_settings, Hash

  def to_settings_hash
    hash   = self.to_h.clone
    custom = hash.delete(:custom_integration_settings)
    hash   = hash.merge(custom) if custom
    hash
  end
end
