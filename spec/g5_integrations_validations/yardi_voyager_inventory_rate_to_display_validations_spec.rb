require "spec_helper"

module G5IntegrationsValidations
  describe YardiVoyagerInventoryRateToDisplayValidations do

    subject { YardiVoyagerInventory.new }

    it { is_expected.to validate_presence_of(:rate_to_display) }
    it do
      is_expected.to validate_inclusion_of(:rate_to_display).
        in_array(YardiVoyagerInventoryRateToDisplayValidations::VALID_OPTIONS)
    end

  end
end
