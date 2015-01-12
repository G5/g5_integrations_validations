class CentershiftInventory

  include G5IntegrationsValidations::CentershiftInventoryValidations
  include Virtus.model
  attribute :in_store_rate_basis, String
  attribute :web_rate_basis, String
  attribute :unit_availability_threshold, Integer
  attribute :in_store_rate_percentage, Float
  attribute :web_rate_discount, Float

end
