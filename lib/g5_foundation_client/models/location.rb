class G5FoundationClient::Location
  include Virtus.model

  attribute :uid, String
  attribute :urn, String
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

  def self.find_by_uid(uid)
    G5FoundationClient::Fetcher.fetch_url(uid) do |markup|
      G5FoundationClient::Deserializers::Location.from_markup(markup)
    end
  end
end
