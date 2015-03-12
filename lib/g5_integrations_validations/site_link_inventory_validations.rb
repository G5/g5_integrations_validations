module G5IntegrationsValidations::SiteLinkInventoryValidations

  VALID_RATE_BASES = %w(push_rate standard_rate)
  VALID_IN_STORE_RATE_BASES = VALID_RATE_BASES + ['calculated_from_web_rate']
  VALID_WEB_RATE_BASES = VALID_RATE_BASES + ['calculated_from_in_store_rate']
  CTAS_FOR_IN_AND_ABOVE_THRESHOLD = %w(quote reserve)
  CTAS_FOR_IN_AND_ABOVE_THRESHOLD_WITH_RENT_NOW = ['quote', 'reserve', 'reserve_fee', 'rent_now']
  CTAS_FOR_BELOW_THRESHOLD = %w(call quote)

  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations

    include G5IntegrationsValidations::RateValidations.model(
      in_store_rate_bases: VALID_IN_STORE_RATE_BASES,
      web_rate_bases: VALID_WEB_RATE_BASES,
    )

    validates :unit_availability_threshold, presence: true
    validates(
      :cta_quote_url,
      :cta_rent_now_url,
      presence: true
    )

    validates_presence_of :cta_reserve_fee_url, :if => lambda { self.cta_reserve_url.blank? }
    validates_presence_of :cta_reserve_url, :if => lambda { self.cta_reserve_fee_url.blank? }

    validates(:unit_availability_cta_in_and_above_threshold, {
      presence: true,
      inclusion: {in: CTAS_FOR_IN_AND_ABOVE_THRESHOLD_WITH_RENT_NOW}
    })
    validates(:unit_availability_cta_below_threshold, {
      inclusion: {in: CTAS_FOR_BELOW_THRESHOLD},
      allow_blank: true
    })
  end

end
