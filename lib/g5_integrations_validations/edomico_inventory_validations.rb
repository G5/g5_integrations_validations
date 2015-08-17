module G5IntegrationsValidations
  module EdomicoInventoryValidations

    CTAS_THRESHOLD_OPTIONS = [
      "reservation_with_fee",
      "reservation",
      "call",
    ]

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      include InventoryCtaValidations.model(ctas: CTAS_THRESHOLD_OPTIONS)

      validates :unit_cta_availability_threshold, presence: true
    end

  end
end


