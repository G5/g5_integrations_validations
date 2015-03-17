module G5IntegrationsValidations
  module CentershiftInventoryValidations
    VALID_RATE_BASES = [
      "street_rate",
      "proforma_rate",
      "rack_rate",
      "future_rate",
      "push_rate",
      "rent_rate",
      "maximum_rent_rate",
      "minimum_rent_rate",
    ]
    VALID_IN_STORE_RATE_BASES = VALID_RATE_BASES + ['calculated_from_web_rate']
    VALID_WEB_RATE_BASES = VALID_RATE_BASES + ['calculated_from_in_store_rate']
    CTAS_THRESHOLD_OPTIONS = [
      "rent_now",
      "hard_reservation_with_fee",
      "hard_reservation",
      "soft_reservation",
      "quote",
    ]

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      include G5IntegrationsValidations::RateValidations.model(
        in_store_rate_bases: VALID_IN_STORE_RATE_BASES,
        web_rate_bases: VALID_WEB_RATE_BASES,
      )

      validates(
        :cta_hard_reservation_with_fee_url,
        :cta_hard_reservation_url,
        :cta_soft_reservation_url,
        :cta_quote_url,
        presence: true
      )

      validates :unit_availability_threshold, presence: true
      validates(:unit_availability_cta_in_and_above_threshold, {
        presence: true,
        inclusion: {in: CTAS_THRESHOLD_OPTIONS}
      })
      validates(:unit_availability_cta_below_threshold, {
        inclusion: {in: CTAS_THRESHOLD_OPTIONS},
        allow_blank: true
      })

    end
  end
end


