class SiteLinkInventory

  include G5IntegrationsValidations::SiteLinkInventoryValidations
  include G5IntegrationsValidations::SiteLinkInventoryCtaThresholdValidations
  include G5IntegrationsValidations::SiteLinkInventoryCtaUrlValidations
  include Virtus.model

  attribute :in_store_rate_basis, String
  attribute :web_rate_basis, String
  attribute :unit_availability_threshold, Integer
  attribute :in_store_rate_percentage, Float
  attribute :web_rate_discount, Float
  attribute :cta_reservation_url, String
  attribute :cta_reservation_with_fee_url, String
  attribute :cta_inquiry_url, String
  attribute :cta_rent_now_url, String
  attribute :unit_availability_cta_in_and_above_threshold, String
  attribute :unit_availability_cta_below_threshold, String

end
