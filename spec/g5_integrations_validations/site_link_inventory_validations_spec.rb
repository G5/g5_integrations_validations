require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end
  it { is_expected.to validate_presence_of(:unit_availability_threshold) }

  it { is_expected.to validate_presence_of(:cta_quote_url) }
  it { is_expected.to validate_presence_of(:cta_rent_now_url) }
  it { is_expected.to validate_presence_of(:cta_reserve_url) }

  it do
    is_expected.
      to validate_presence_of(:unit_availability_cta_in_and_above_threshold)
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
      in_array(['quote', 'reserve', 'rent now'])
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_below_threshold).
      in_array(%w(call quote))
  end

end
