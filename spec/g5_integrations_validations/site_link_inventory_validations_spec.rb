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
      in_array(['quote', 'reserve', 'rent_now'])
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_below_threshold).
      in_array(%w(call quote))
  end

end
