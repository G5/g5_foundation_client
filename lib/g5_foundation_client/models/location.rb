class G5FoundationClient::Location
  extend G5FoundationClient::FindableByUid

  attr_accessor :location_hash, :client

  def initialize(attrs)
    self.client        = attrs.delete(:client) || attrs.delete('client')
    self.location_hash = ActiveSupport::HashWithIndifferentAccess.new attrs.fetch(:location, attrs)
  end

  [:id, :uid, :client_uid, :client_id, :name, :corporate, :created_at, :updated_at, :urn,
   :street_address_1, :street_address_2, :city, :state, :postal_code,
   :fax, :email, :hours, :twitter_username, :facebook_username, :yelp_username,
   :pinterest_username, :foursquare_username, :tumblr_username, :instagram_username,
   :vimeo_username, :youtube_username, :domain, :phone_number, :neighborhood, :boat_storage,
   :business_storage, :gate_access, :security_monitoring, :business_center, :climate_controlled,
   :heated_cooled, :friendly_staff, :covered_drivethru, :covered_loading, :rv_boat_storage,
   :outside_parking, :deliveries, :dollies_carts, :digital_surveillance, :drive_up_access,
   :electronic_gate, :uhaul_trucks, :budget_trucks, :moving_trucks, :free_truck, :fenced_lighted,
   :ground_level_units, :high_ceilings, :individual_alarmed_units, :mail_boxes, :major_credit_cards,
   :military_discounts, :student_discount, :senior_discount, :month_to_month, :no_admin_fee, :no_deposits,
   :no_late_fees, :online_bill_pay, :packing_moving_supplies, :boxes_locks, :tenant_insurance, :truck_rentals,
   :wide_driveways, :wine_storage, :other_features, :rv_storage, :seven_day_access, :other_storage,
   :specific_demographic, :primary_offering, :secondary_other, :secondary_condo, :secondary_townhomes, :secondary_apartments, :floor_plans,
   :nearby_schools, :highrise_structure, :garden_structure, :townhome_structure, :modern_structure, :nearby_employers, :dogs_allowed,
   :cats_allowed, :accessibility, :air_conditioned, :cable_included, :ceiling_fans, :custom_cabinetry, :dishwasher,
   :energy_efficient, :fireplace, :granite_counters, :hardwood_floors, :private_balcony, :private_patio, :refrigerator,
   :stainless_appliances, :smoke_free, :style_design, :style_cost, :walkin_closet, :washer_dryer, :has_view, :other_amenities,
   :carport_parking, :club_house, :dog_park, :corporate_suites, :family_friendly, :fitness_center, :furnished_apartments, :garages,
   :gated_entrance, :laundry_facilities, :online_rental_payments, :onsite_management, :close_park, :pet_friendly, :playground,
   :recycling_center, :swimming_pool, :hot_tub, :storage_available, :tennis_court, :wifi_available, :other_community_amenities,
   :primary_offering_other, :ga_tracking_id, :ga_profile_id, :landmark_1_type, :landmark_1_name, :landmark_2_type, :landmark_2_name,
   :property_feature_1, :property_feature_2, :property_feature_3, :apartment_amenity_1, :apartment_amenity_2,
   :community_amenity_1, :community_amenity_2, :status, :no_call_tracking].each do |field|
    define_method(field) { self.location_hash[field] }
  end

  alias_method :locality, :city
  alias_method :region, :state
  alias_method :primary_landmark, :landmark_1_name
  alias_method :primary_amenity, :apartment_amenity_1


  def street_address
    return street_address_1 if street_address_2.blank?
    "#{street_address_1}\n#{street_address_2}"
  end

  def groups
    build('groups')
  end

  def amenities
    build('amenities')
  end

  private

  def build(attributes)
    self.location_hash.fetch(attributes.to_sym, []).map do |hash|
      klass = "::G5FoundationClient::#{attributes.singularize.capitalize}"
      klass.constantize.new(hash)
    end
  end
end
