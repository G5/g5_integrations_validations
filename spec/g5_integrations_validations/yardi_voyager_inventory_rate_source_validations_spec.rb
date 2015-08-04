require "spec_helper"

module G5IntegrationsValidations
  describe MultiFamilyInventoryRateSourceValidations do

    subject { YardiVoyagerInventory.new }

    it do
      is_expected.
        to validate_inclusion_of(:rate_source).
        in_array(%w(vendor_rate available_rate))
    end

  end
end
