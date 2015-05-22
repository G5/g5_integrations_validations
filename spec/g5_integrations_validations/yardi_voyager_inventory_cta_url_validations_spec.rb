require "spec_helper"

module G5IntegrationsValidations
  describe YardiVoyagerInventoryCtaUrlValidations do

    subject { YardiVoyagerInventory.new }
    it { is_expected.to validate_presence_of(:cta_reservation_url) }

  end
end
