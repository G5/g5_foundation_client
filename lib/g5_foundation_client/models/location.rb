class G5FoundationClient::Location
  include Virtus.model

  attribute :uid, String
  attribute :name, String
  attribute :phone, String

  def self.find_by_uid(uid)
    response = HTTParty.get(uid, query_options)
    response_code = response.response.code.to_i

    case response_code
    when 200
      hcard = Microformats2.parse(response.body).cards.first
      new(
        uid: hcard.uid.to_s,
        name: hcard.name.to_s,
        phone: hcard.adr.format.tel.to_s
      )
    when 404
      raise G5FoundationClient::RecordNotFoundException.new(
        "Couldn't find Location with UID: '#{uid}'"
      )
    else
      raise Exception.new(
        "I got an unexpected response code '#{response.response.code}'"
      )
    end
  end

protected

  def self.query_options
    {query: { access_token:  G5FoundationClient::access_token } }
  end
end
