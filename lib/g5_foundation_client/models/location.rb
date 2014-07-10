class G5FoundationClient::Location
  include Virtus.model
  extend G5FoundationClient::FindableByUid

  def self.deserializer_class
    G5FoundationClient::Deserializers::Location
  end

  attribute :uid, String
  attribute :urn, String
  attribute :client_uid, String
  attribute :name, String
  attribute :phone, String
  attribute :domain, String
  attribute :corporate, Boolean
  attribute :floor_plans, String
  attribute :primary_amenity, String
  attribute :qualifier, String
  attribute :primary_landmark, String
  attribute :ga_tracking_id, String
  attribute :ga_profile_id, String
  attribute :neighborhood, String
  attribute :street_address, String
  attribute :region, String
  attribute :locality, String
  attribute :postal_code, String
end
