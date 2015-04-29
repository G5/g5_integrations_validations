module G5IntegrationsValidations
  module YardiVoyagerInventoryCtaUrlValidations
    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations

      validates_presence_of :cta_reservation_url
    end
  end

end
