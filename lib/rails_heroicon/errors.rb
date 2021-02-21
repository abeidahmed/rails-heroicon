module RailsHeroicon
  class UndefinedVariant < StandardError
    def initialize(msg = "", exception_type = "custom")
      msg = msg.empty? ? "Variant should be one of #{RailsHeroicon::VARIANTS.join(", ")}" : msg

      @exception_type = exception_type
      super(msg)
    end
  end
end
