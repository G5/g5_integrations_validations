module G5IntegrationsValidations
  module CentershiftCtaUrlValidations

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations

      validates(
        :cta_reservation_with_fee_url,
        :cta_reservation_url,
        :cta_hold_url,
        :cta_inquiry_url,
        :cta_more_information_url,
        presence: true
      )
    end

  end
end
