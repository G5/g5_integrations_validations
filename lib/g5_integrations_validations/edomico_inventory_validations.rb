module G5IntegrationsValidations
  module EdomicoInventoryValidations
    CTAS_ABOVE_THRESHOLD_OPTIONS = [
      "reservation_with_fee",
      "reservation",
    ]

    CTAS_BELOW_THRESHOLD_OPTIONS = ["call"]

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations

      validates :unit_availability_threshold, presence: true
      validates(:unit_availability_cta_in_and_above_threshold, {
        presence: true,
        inclusion: {in: CTAS_ABOVE_THRESHOLD_OPTIONS}
      })
      validates(:unit_availability_cta_below_threshold, {
        inclusion: {in: CTAS_BELOW_THRESHOLD_OPTIONS},
        allow_blank: true
      })

    end
  end
end


