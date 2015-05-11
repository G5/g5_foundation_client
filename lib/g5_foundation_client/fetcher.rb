class G5FoundationClient::Fetcher
  def self.fetch_url(url, &block)
    response = HTTParty.get(
        url,
        headers: {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    )

    case response.response.code.to_i
      when 200
        yield response.body
      when 404
        raise G5FoundationClient::RecordNotFoundException.new(
                  "Couldn't find record at URL '#{url}'"
              )
      else
        raise G5FoundationClient::Error.new(
                  "I got an unexpected response code '#{response.response.code}'"
              )
    end
  end
end
