module G5FoundationClient::Deserializers
  module IntegrationSetting
    extend SafeAccess

    class << self
      def from_hcard(hcard)
        G5FoundationClient::IntegrationSetting.new(hcard_to_hash(hcard))
      end

      def hcard_to_hash(h)
        {
            inventory_service_url:        with_safe_access { h.g5_inventory_service_url },
            inventory_service_auth_token: with_safe_access { h.g5_inventory_service_auth_token },
            etl_strategy_name:            with_safe_access { h.g5_etl_strategy_name },
            inventory_vendor_endpoint:    with_safe_access { h.g5_inventory_vendor_endpoint },
            inventory_vendor_user_name:   with_safe_access { h.g5_inventory_vendor_user_name },
            inventory_vendor_password:    with_safe_access { h.g5_inventory_vendor_password },
            lead_strategy_name:           with_safe_access { h.g5_lead_strategy_name },
            lead_vendor_endpoint:         with_safe_access { h.g5_lead_vendor_endpoint },
            lead_vendor_user_name:        with_safe_access { h.g5_lead_vendor_user_name },
            lead_vendor_password:         with_safe_access { h.g5_lead_vendor_password },
            custom_integration_settings:  custom_integration_settings_from_hcard(h)
        }
      end

      def num_custom_elements(hcard)
        hcard.methods.collect(&:to_s).count { |setting| setting =~ /g5_custom_integration_setting_name_\d+$/ }
      end

      def custom_integration_settings_from_hcard(hcard)
        custom_settings = Hash.new

        num_custom_elements(hcard).times do |index|
          name                         = with_safe_access { hcard.send("g5_custom_integration_setting_name_#{index}") }
          value                        = with_safe_access { hcard.send("g5_custom_integration_setting_value_#{index}") }
          custom_settings[name.to_sym] = value
        end
        custom_settings
      end
    end
  end
end
