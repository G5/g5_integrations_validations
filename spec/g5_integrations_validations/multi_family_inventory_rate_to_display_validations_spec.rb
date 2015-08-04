require "spec_helper"

module G5IntegrationsValidations
  describe MultiFamilyInventoryRateToDisplayValidations do

    subject { YardiRentCafeInventory.new }

    it do
      is_expected.
        to validate_inclusion_of(:rate_to_display).
        in_array(MultiFamilyInventoryRateToDisplayValidations::VALID_OPTIONS)
    end

  end
end
