module G5IntegrationsValidations
  module CentershiftCtaUrlValidations

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations

      validates(
        :cta_hard_reservation_with_fee_url,
        :cta_hard_reservation_url,
        :cta_soft_reservation_url,
        :cta_quote_url,
        presence: true
      )
    end

  end
end
