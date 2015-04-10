module G5IntegrationsValidations::SiteLinkInventoryPresenceValidations

  extend ActiveSupport::Concern

  included do
    include G5IntegrationsValidations::SiteLinkInventoryCtaThresholdValidations
    include G5IntegrationsValidations::SiteLinkInventoryCtaUrlValidations
  end

end
