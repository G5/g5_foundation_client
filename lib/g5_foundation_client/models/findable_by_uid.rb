module G5FoundationClient::FindableByUid
  def find_by_uid(uid)
    G5FoundationClient::Fetcher.fetch_url(uid) do |markup|
      deserializer_class.from_markup(markup)
    end
  end
end
