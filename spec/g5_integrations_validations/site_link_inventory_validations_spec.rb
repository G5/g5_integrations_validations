require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
      in_array([
        'inquiry',
        'reservation',
        'rent_now',
        'rent_now_or_reservation',
        'rent_now_or_reservation_with_fee'
      ])
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_below_threshold).
      in_array(%w(call inquiry))
  end

end
