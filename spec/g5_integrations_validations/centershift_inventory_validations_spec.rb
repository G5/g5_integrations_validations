require "spec_helper"

module G5IntegrationsValidations
  describe CentershiftInventoryValidations do

    subject { CentershiftInventory.new }
    let(:allowed_ctas) do
      [
        "rent_now",
        "hold",
        "reservation_with_fee",
        "reservation",
        "inquiry",
        "call",
      ]
    end

    it { is_expected.to validate_presence_of(:in_store_rate_basis) }
    it { is_expected.to validate_presence_of(:web_rate_basis) }

    it do
      is_expected.
        to validate_presence_of(:unit_availability_cta_in_and_above_threshold)
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
        in_array(allowed_ctas)
    end
    it do
      is_expected.
        to validate_presence_of(:unit_availability_cta_below_threshold)
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_below_threshold).
        in_array(allowed_ctas)
    end

    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_2_in_and_above_threshold).
        in_array(allowed_ctas).allow_blank(true)
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_2_below_threshold).
        in_array(allowed_ctas).allow_blank(true)
    end
  end
end
