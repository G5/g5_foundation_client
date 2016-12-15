module G5FoundationClient
  class Group
    attr_reader :attributes

    def initialize(attrs)
      @attributes = ActiveSupport::HashWithIndifferentAccess.new(attrs)
    end

    [:id, :name, :description, :urn, :core_group_id, :created_at, :updated_at].each do |field|
      define_method(field) { self.attributes[field] }
    end
  end
end
