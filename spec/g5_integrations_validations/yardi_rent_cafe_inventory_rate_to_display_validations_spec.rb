require "spec_helper"

module G5IntegrationsValidations
  describe YardiRentCafeInventoryRateToDisplayValidations do

    subject { YardiRentCafeInventory.new }

    it do
      is_expected.
        to validate_inclusion_of(:rate_to_display).
        in_array(YardiRentCafeInventoryRateToDisplayValidations::VALID_OPTIONS)
    end

  end
end
