require "spec_helper"

module G5IntegrationsValidations
  describe YardiRentCafeInventoryCtaThresholdValidations do

    subject { YardiRentCafeInventory.new }

    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
        in_array(%w(inquiry))
    end

    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_below_threshold).
        in_array(%w(call))
    end

  end
end
