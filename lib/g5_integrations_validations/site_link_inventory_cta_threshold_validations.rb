module G5IntegrationsValidations::SiteLinkInventoryCtaThresholdValidations

  extend ActiveSupport::Concern

  included do
    validates(
      :unit_availability_threshold,
      :unit_availability_cta_in_and_above_threshold,
      presence: true
    )
  end

end
