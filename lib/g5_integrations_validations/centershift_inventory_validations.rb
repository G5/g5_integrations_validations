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

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      include G5IntegrationsValidations::RateValidations.model(
        in_store_rate_bases: VALID_IN_STORE_RATE_BASES,
        web_rate_bases: VALID_WEB_RATE_BASES,
      )
    end
  end
end


