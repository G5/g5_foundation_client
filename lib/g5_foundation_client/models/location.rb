class G5FoundationClient::Location
  include Virtus.model

  attribute :uid, String
  attribute :name, String
  attribute :phone, String

  def self.find_by_uid(uid)
    G5FoundationClient::Fetcher.fetch_url(uid) do |markup|
      G5FoundationClient::Deserializers::Location.from_markup(markup)
    end
  end
end
