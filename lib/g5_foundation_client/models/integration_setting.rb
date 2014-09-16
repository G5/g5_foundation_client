class G5FoundationClient::IntegrationSetting
  include Virtus.model

  def self.deserializer_class
    G5FoundationClient::Deserializers::IntegrationSetting
  end

  attribute :inventory_service_url, String
  attribute :etl_strategy_name, String
  attribute :vendor_endpoint, String
  attribute :vendor_user_name, String
  attribute :vendor_password, String
  attribute :custom_integration_settings, Hash

  def to_settings_hash
    hash   = self.to_h.clone
    custom = hash.delete(:custom_integration_settings)
    hash   = hash.merge(custom) if custom
    hash
  end
end
