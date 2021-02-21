module RailsHeroicon
  module DataAttributes
    def data_attributes(**args)
      args_without_attributes = args.except(:attributes)
      args[:attributes] = {} if args[:attributes].nil?

      args_without_attributes.each_key do |attr|
        if args[:attributes].keys.include?(attr)
          args[:attributes][attr] += " #{args[attr]}"
        else
          args[:attributes].merge!(Hash[attr, args[attr]])
        end
      end

      args[:attributes]
    end
  end
end
