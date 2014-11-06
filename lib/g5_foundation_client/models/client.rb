class G5FoundationClient::Client
  extend G5FoundationClient::FindableByUid
  attr_accessor :client_hash

  def initialize(attrs)
    self.client_hash = ActiveSupport::HashWithIndifferentAccess.new attrs.fetch(:client, attrs)
  end

  class << self
    def all_client_uids(clients_uri)
      G5FoundationClient::Fetcher.fetch_url(clients_uri) do |json|
        hash = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(json))
        hash[:clients].collect { |client| client[:uid] }
      end
    end
  end

  [:id, :uid, :name, :urn, :vertical, :street_address_1, :street_address_2,
   :city, :state, :postal_code, :fax, :email, :tel, :domain_type, :domain].each do |field|
    define_method(field) { self.client_hash[field] }
  end

  def locations
    @locations ||= self.client_hash[:locations].collect { |lh| G5FoundationClient::Location.new(lh.merge(client: self)) }
  end
end
