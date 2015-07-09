class YardiRentCafeInventory

  include G5IntegrationsValidations::YardiVoyagerInventoryRateToDisplayValidations
  include Virtus.model

  attribute :rate_to_display, String

end
