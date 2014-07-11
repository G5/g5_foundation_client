module G5FoundationClient::Deserializers
  module Location
    extend SafeAccess

    def self.from_markup(markup)
      hcard = Microformats2.parse(markup).cards.first
      from_hcard(hcard)
    end

    def self.from_hcard(hcard)
      G5FoundationClient::Location.new(hcard_to_hash(hcard))
    end

    def self.hcard_to_hash(h)
      {
        uid: with_safe_access { h.uid },
        urn: with_safe_access { h.g5_urn },
        client_uid: with_safe_access { h.org.format.uid.to_s},
        name: with_safe_access { h.name },
        phone_number: with_safe_access { h.adr.format.tel },
        domain: with_safe_access { h.g5_domain },
        corporate: with_safe_access { h.g5_corporate },
        floor_plans: with_safe_access { h.g5_floorplan },
        primary_amenity: with_safe_access { h.g5_aparment_amenity_1 },
        qualifier: with_safe_access { h.g5_aparment_feature_1 },
        primary_landmark: with_safe_access { h.g5_landmark_1 },
        ga_tracking_id: with_safe_access { h.ga_tracking_id },
        ga_profile_id: with_safe_access { h.ga_profile_id },
        neighborhood: with_safe_access { h.adr.format.g5_neighborhood },
        street_address: with_safe_access { h.adr.format.street_address },
        region: with_safe_access { h.adr.format.region },
        locality: with_safe_access { h.adr.format.locality },
        postal_code: with_safe_access { h.adr.format.postal_code }
      }
    end
  end
end
