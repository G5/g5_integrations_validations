class EdomicoInventory

  include G5IntegrationsValidations::EdomicoInventoryValidations
  include Virtus.model
  attribute :unit_availability_threshold, Integer
  attribute :cta_reservation_with_deposit_url, String
  attribute :cta_reservation_without_deposit_url, String

  attribute :unit_availability_threshold, Integer
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String

end
