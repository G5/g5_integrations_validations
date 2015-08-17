module G5IntegrationsValidations
  module RealPageInventoryValidations
    CTAS_THRESHOLD_OPTIONS = [
      "reservation",
      "call",
    ]

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      include InventoryCtaValidations.model(ctas: CTAS_THRESHOLD_OPTIONS)

      validates :unit_cta_availability_threshold, presence: true
      validates(:apartment_selection, {
        presence: true,
        inclusion: { in: %w(all available) }
      })
    end

  end
end
