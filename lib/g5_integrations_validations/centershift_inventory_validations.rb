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
      "hold",
      "reservation_with_fee",
      "reservation",
      "inquiry",
      "call",
      "call_met",
      "inquiry_met",
      "more_information",
      "contact_us"
    ]

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      include InventoryCtaValidations.model(ctas: CTAS_THRESHOLD_OPTIONS)
      include G5IntegrationsValidations::RateValidations.model(
        in_store_rate_bases: VALID_IN_STORE_RATE_BASES,
        web_rate_bases: VALID_WEB_RATE_BASES,
      )

      validates :unit_cta_availability_threshold, presence: true
    end
  end
end


