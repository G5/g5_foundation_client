module G5FoundationClient::Deserializers
  module Location
    def self.from_markup(markup)
      hcard = Microformats2.parse(markup).cards.first
      G5FoundationClient::Location.new(
        uid: hcard.uid.to_s,
        name: hcard.name.to_s,
        phone: hcard.adr.format.tel.to_s
      )
    end
  end
end