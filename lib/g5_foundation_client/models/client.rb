class G5FoundationClient::Client
  include Virtus.model
  extend G5FoundationClient::FindableByUid

  def self.deserializer_class
    G5FoundationClient::Deserializers::Client
  end

  attribute :uid, String
  attribute :urn, String
  attribute :name, String
  attribute :vertical, String
  attribute :domain, String
  attribute :domain_type, String
end
