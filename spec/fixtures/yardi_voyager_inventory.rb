class YardiVoyagerInventory

  include G5IntegrationsValidations::YardiVoyagerInventoryCtaUrlValidations
  include G5IntegrationsValidations::YardiVoyagerInventoryCtaThresholdValidations
  include G5IntegrationsValidations::MultiFamilyInventoryRateSourceValidations
  include G5IntegrationsValidations::YardiVoyagerInventoryValidations
  include G5IntegrationsValidations::MultiFamilyInventoryRateToDisplayValidations
  include Virtus.model
  attribute :api_version, String
  attribute :database, String
  attribute :interface_entity, String
  attribute :platform, String
  attribute :server_name, String

  attribute :cta_reservation_url, String
  attribute :unit_cta_availability_threshold, String
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String
  attribute :rate_source, String
  attribute :rate_to_display, String

end
