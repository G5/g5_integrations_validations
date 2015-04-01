module G5IntegrationsValidations::SiteLinkInventoryPresenceValidations

  extend ActiveSupport::Concern

  included do
    validates(
      :cta_inquiry_url,
      :cta_rent_now_url,
      :unit_availability_threshold,
      :unit_availability_cta_in_and_above_threshold,
      presence: true
    )

    validates_presence_of(:cta_reservation_with_fee_url, {
      if: -> { self.cta_reservation_url.blank? },
    })
    validates_presence_of(:cta_reservation_url, {
      if: -> { self.cta_reservation_with_fee_url.blank? },
    })

  end

end
