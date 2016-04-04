require "spec_helper"

module G5IntegrationsValidations
  describe CentershiftCtaUrlValidations do

    subject { CentershiftInventory.new }

    it do
      is_expected.to validate_presence_of(:cta_reservation_with_fee_url)
    end
    it { is_expected.to validate_presence_of(:cta_reservation_url) }
    it { is_expected.to validate_presence_of(:cta_hold_url) }
    it { is_expected.to validate_presence_of(:cta_inquiry_url) }
    it { is_expected.to validate_presence_of(:cta_more_information_url) }

  end
end
