module G5IntegrationsValidations
  module YardiRentCafeInventoryCtaUrlValidations
    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations

      validates_presence_of :cta_inquiry_url
    end
  end

end
