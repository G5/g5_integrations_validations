module G5IntegrationsValidations::SiteLinkInventoryCtaThresholdValidations

  extend ActiveSupport::Concern

  included do
    validates(:unit_cta_availability_threshold, presence: true)
  end

end
