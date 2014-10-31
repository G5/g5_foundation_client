class G5FoundationClient::IntegrationSetting
  attr_accessor :integration_setting_hash
  attr_accessor :location

  def initialize(attrs)
    self.integration_setting_hash = attrs
    self.location                 = self.integration_setting_hash.delete(:location)
  end

  def to_settings_hash
    self.integration_setting_hash
  end

  def lead?
    'lead' == self.vendor_action
  end

  def inventory?
    'inventory' == self.vendor_action
  end

  [:location_uid, :urn, :uid, :job_frequency_in_minutes, :vendor_action, :strategy_name,
   :vendor_endpoint, :vendor_user_name, :vendor_password].each do |field|
    define_method(field) { self.integration_setting_hash[field] }
  end

  def vendor_action
    self.integration_setting_hash[:vendor_action]
  end
end
