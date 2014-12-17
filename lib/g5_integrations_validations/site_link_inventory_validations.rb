module G5IntegrationsValidations::SiteLinkInventoryValidations

  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations

    VALID_RATE_BASES = %w(push_rate standard_rate)
    VALID_IN_STORE_RATE_BASES = VALID_RATE_BASES + ['calculated_from_web_rate']
    VALID_WEB_RATE_BASES = VALID_RATE_BASES + ['calculated_from_in_store_rate']
    CTAS_FOR_IN_AND_ABOVE_THRESHOLD = %w(quote reserve)
    CTAS_FOR_BELOW_THRESHOLD = %w(call quote)

    validates :unit_availability_threshold, presence: true
    validates(:in_store_rate_percentage, {
      presence: true,
      numericality: {greater_than_or_equal_to: 0},
      if: -> (o) { o.in_store_rate_basis == 'calculated_from_web_rate' },
    })
    validates(:web_rate_discount, {
      numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100},
      if: -> (o) { o.web_rate_basis == 'calculated_from_in_store_rate' },
    })
    validates(:web_rate_basis, {
      inclusion: {in: VALID_WEB_RATE_BASES},
      allow_nil: true,
    })
    validates(:web_rate_basis, {
      presence: true,
      exclusion: %w(calculated_from_in_store_rate),
      if: -> (o) do
        o.in_store_rate_basis == 'calculated_from_web_rate' ||
          o.in_store_rate_basis.nil?
      end,
    })
    validates(:in_store_rate_basis, {
      presence: true,
      inclusion: {in: VALID_IN_STORE_RATE_BASES},
    })
    validates(:in_store_rate_basis, {
      exclusion: %w(calculated_from_web_rate),
      if: -> (o) do
        o.web_rate_basis == 'calculated_from_in_store_rate' ||
          o.web_rate_basis.nil?
      end,
    })
    validates :cta_reserve_url, presence: true
    validates(:cta_quote_url, {
      presence: true,
      if: -> (o) { o.unit_availability_cta_below_threshold == "quote" },
    })
    validates(:unit_availability_cta_in_and_above_threshold, {
      presence: true,
      inclusion: {in: CTAS_FOR_IN_AND_ABOVE_THRESHOLD}
    })
    validates(:unit_availability_cta_below_threshold, {
      inclusion: {in: CTAS_FOR_BELOW_THRESHOLD},
      allow_blank: true
    })
  end

end
