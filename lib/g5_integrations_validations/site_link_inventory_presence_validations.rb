module G5IntegrationsValidations
  module SiteLinkInventoryPresenceValidations

    extend ActiveSupport::Concern

    included do
      include SiteLinkInventoryCtaThresholdValidations
      include SiteLinkInventoryCtaUrlValidations
    end

  end
end
