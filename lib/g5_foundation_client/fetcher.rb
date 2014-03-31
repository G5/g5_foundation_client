class G5FoundationClient::Fetcher
  def self.fetch_url(url, &block)
    response = HTTParty.get(
      url,
      { query: { access_token: G5FoundationClient::access_token } }
    )

    case response.response.code.to_i
    when 200
      yield response.body
    when 404
      raise G5FoundationClient::RecordNotFoundException.new(
        "Couldn't find record at URL '#{url}'"
      )
    else
      raise Exception.new(
        "I got an unexpected response code '#{response.response.code}'"
      )
    end
  end

protected

  def self.query_options
  end
end
