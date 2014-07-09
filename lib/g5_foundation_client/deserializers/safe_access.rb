module G5FoundationClient::Deserializers
  module SafeAccess
    def with_safe_access(options = {}, &block)
      options[:stringify] = true if options[:stringify] == nil

      result = block.call
      options[:stringify] ? result.to_s : result
    rescue NoMethodError
      nil
    end
  end
end
