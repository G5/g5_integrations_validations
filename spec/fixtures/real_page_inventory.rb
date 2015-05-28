class RealPageInventory

  include G5IntegrationsValidations::RealPageInventoryValidations
  include Virtus.model
  attribute :unit_availability_threshold, Integer
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String

end
