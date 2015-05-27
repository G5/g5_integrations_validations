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
        in_array([
          "rent_now",
          "hold",
          "reservation_with_fee",
          "reservation",
          "inquiry",
        ])
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_below_threshold).
        in_array(%w(hold reservation inquiry call))
    end

    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_2_in_and_above_threshold).
        in_array([
          "rent_now",
          "hold",
          "reservation_with_fee",
          "reservation",
          "inquiry",
        ]).allow_blank(true)
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_2_below_threshold).
        in_array(%w(hold reservation inquiry call))
    end
  end
end
