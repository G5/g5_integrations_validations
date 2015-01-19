class SiteLinkInventory

  include G5IntegrationsValidations::SiteLinkInventoryValidations
  include Virtus.model
  attribute :in_store_rate_basis, String
  attribute :web_rate_basis, String
  attribute :unit_availability_threshold, Integer
  attribute :in_store_rate_percentage, Float
  attribute :web_rate_discount, Float
  attribute :cta_reserve_url, Float
  attribute :cta_quote_url, String
  attribute :cta_rent_now_url, String
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String

end
