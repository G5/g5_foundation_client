module G5FoundationClient::Deserializers
  module Client
    extend SafeAccess

    def self.from_markup(markup)
      h = Microformats2.parse(markup).cards.first
      G5FoundationClient::Client.new(
        uid: with_safe_access { h.uid },
        urn: with_safe_access { h.g5_urn },
        name: with_safe_access { h.name },
        vertical: with_safe_access { h.g5_vertical },
        domain: with_safe_access { h.g5_domain },
        domain_type: with_safe_access { h.g5_domain_type }
      )
    end
  end
end
