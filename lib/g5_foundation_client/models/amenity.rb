module G5FoundationClient
  class Amenity
    attr_reader :attributes

    def initialize(attrs)
      @attributes = ActiveSupport::HashWithIndifferentAccess.new(attrs)
    end

    [:name, :icon, :id, :created_at, :updated_at].each do |field|
      define_method(field) { self.attributes[field] }
    end
  end
end