require "spec_helper"

module G5IntegrationsValidations
  describe EdomicoInventoryValidations do

    subject { EdomicoInventory.new }

    it "includes cta validations" do
      expect(subject.class < InventoryCtaValidations).to be true
    end

    it do
      is_expected.
        to validate_presence_of(:unit_availability_threshold)
    end

  end
end
