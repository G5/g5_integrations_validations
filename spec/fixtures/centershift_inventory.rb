class CentershiftInventory

  include G5IntegrationsValidations::CentershiftInventoryValidations
  include Virtus.model
  attribute :in_store_rate_basis, String
  attribute :web_rate_basis, String
  attribute :unit_availability_threshold, Integer
  attribute :in_store_rate_percentage, Float
  attribute :web_rate_discount, Float
  attribute :cta_hard_reservation_url, String
  attribute :cta_soft_reservation_url, String
  attribute :cta_quote_url, String

  attribute :unit_availability_threshold, Integer
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String

end
