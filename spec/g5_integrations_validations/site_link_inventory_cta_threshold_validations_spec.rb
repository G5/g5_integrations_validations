require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryCtaThresholdValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end

  it { is_expected.to validate_presence_of(:unit_availability_threshold) }

end
