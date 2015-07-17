require "spec_helper"

module G5IntegrationsValidations
  describe YardiRentCafeInventoryCtaUrlValidations do

    subject { YardiRentCafeInventory.new }
    it { is_expected.to validate_presence_of(:cta_inquiry_url) }

  end
end
