module G5IntegrationsValidations::SiteLinkInventoryPresenceValidations

  extend ActiveSupport::Concern

  included do
    include SiteLinkInventoryCtaThresholdValidations
    include SiteLinkInventoryCtaUrlValidations
  end

end
