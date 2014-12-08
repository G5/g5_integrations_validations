class SiteLinkLead

  include G5IntegrationsValidations::SiteLinkLeadValidations
  include Virtus.model
  attribute :charge_mode, String

end
