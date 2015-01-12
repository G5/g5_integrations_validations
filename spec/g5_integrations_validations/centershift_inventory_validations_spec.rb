require "spec_helper"

module G5IntegrationsValidations
  describe CentershiftInventoryValidations do

    subject { CentershiftInventory.new }

    it { is_expected.to validate_presence_of(:in_store_rate_basis) }
    it { is_expected.to validate_presence_of(:web_rate_basis) }

  end
end
