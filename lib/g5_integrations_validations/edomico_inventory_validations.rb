module G5IntegrationsValidations
  module EdomicoInventoryValidations
    CTAS_ABOVE_THRESHOLD_OPTIONS = [
      "reservation_with_deposit",
      "reservation_without_deposit",
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
      validates :cta_reservation_with_deposit_url, presence: true
      validates :cta_reservation_without_deposit_url, presence: true

    end
  end
end


