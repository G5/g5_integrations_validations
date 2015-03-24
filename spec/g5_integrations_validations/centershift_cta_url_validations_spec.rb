require "spec_helper"

module G5IntegrationsValidations
  describe CentershiftCtaUrlValidations do

    subject { CentershiftInventory.new }

    it do
      is_expected.to validate_presence_of(:cta_hard_reservation_with_fee_url)
    end
    it { is_expected.to validate_presence_of(:cta_hard_reservation_url) }
    it { is_expected.to validate_presence_of(:cta_soft_reservation_url) }
    it { is_expected.to validate_presence_of(:cta_quote_url) }

  end
end
