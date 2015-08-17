class YardiRentCafeInventory
  include G5IntegrationsValidations::YardiRentCafeInventoryCtaUrlValidations
  include G5IntegrationsValidations::YardiRentCafeInventoryCtaThresholdValidations
  include G5IntegrationsValidations::YardiRentCafeInventoryValidations
  include G5IntegrationsValidations::MultiFamilyInventoryRateToDisplayValidations
  include Virtus.model

  attribute :cta_inquiry_url, String
  attribute :unit_cta_availability_threshold, String
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String
  attribute :rate_to_display, String

end
