module G5FoundationClient::FindableByUid
  def find_by_uid(uid)
    G5FoundationClient::Fetcher.fetch_url(uid) do |json|
      new(ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(json)))
    end
  end
end
