require "spec_helper"

module G5IntegrationsValidations
  describe EdomicoInventoryValidations do

    subject { EdomicoInventory.new }

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
        in_array(%w(reservation_with_deposit reservation_without_deposit))
    end
    it do
      is_expected.
        to validate_inclusion_of(:unit_availability_cta_below_threshold).
        in_array(%w(call))
    end

  end
end
