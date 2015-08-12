require "spec_helper"

module G5IntegrationsValidations
  describe RealPageInventoryValidations do

    subject { RealPageInventory.new }

    it do
      is_expected.
        to validate_presence_of(:unit_availability_threshold)
    end
    it do
      is_expected.
        to validate_presence_of(:unit_availability_cta_in_and_above_threshold)
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
        in_array(%w(reservation))
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_below_threshold).
        in_array(%w(call))
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_2_in_and_above_threshold).
        in_array(%w(reservation))
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_2_below_threshold).
        in_array(%w(call))
    end
    it do
      is_expected.to validate_presence_of(:apartment_availability_basis)
    end
    it do
      is_expected.to validate_inclusion_of(:apartment_availability_basis).
        in_array(%w(all available))
    end

  end
end
