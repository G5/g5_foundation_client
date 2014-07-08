class G5FoundationClient::Client
  include Virtus.model

  attribute :uid, String
  attribute :urn, String
  attribute :name, String
  attribute :vertical, String
  attribute :domain, String
  attribute :domain_type, String

  def self.find_by_uid(uid)
    G5FoundationClient::Fetcher.fetch_url(uid) do |markup|
      G5FoundationClient::Deserializers::Client.from_markup(markup)
    end
  end
end
