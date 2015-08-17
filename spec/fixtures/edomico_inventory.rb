class EdomicoInventory

  include G5IntegrationsValidations::EdomicoInventoryValidations
  include Virtus.model
  attribute :unit_cta_availability_threshold, Integer

  attribute :unit_cta_availability_threshold, Integer
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String
  attribute :unit_availability_cta_2_in_and_above_threshold, String
  attribute :unit_availability_cta_2_below_threshold, String

end
