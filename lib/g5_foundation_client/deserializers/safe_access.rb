module G5FoundationClient::Deserializers
  module SafeAccess
    def with_safe_access(&block)
      block.call.to_s
    rescue NoMethodError
      nil
    end
  end
end
