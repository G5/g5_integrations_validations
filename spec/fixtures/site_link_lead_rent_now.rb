class SiteLinkLeadRentNow

  include G5IntegrationsValidations::SiteLinkLeadRentNowValidations
  include Virtus.model
  attribute :max_move_in_days_from_now, Integer

end
