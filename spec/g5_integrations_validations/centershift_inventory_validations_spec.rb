require "spec_helper"

module G5IntegrationsValidations
  describe CentershiftInventoryValidations do

    subject { CentershiftInventory.new }

    it { is_expected.to validate_presence_of(:in_store_rate_basis) }
    it { is_expected.to validate_presence_of(:web_rate_basis) }

    it do
      is_expected.
        to validate_presence_of(:unit_availability_cta_in_and_above_threshold)
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
        in_array(%w(soft_reservation hard_reservation quote))
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_below_threshold).
        in_array([
          "rent_now",
          "soft_reservation",
          "hard_reservation_with_fee",
          "hard_reservation",
          "quote",
        ])
    end
  end
end
