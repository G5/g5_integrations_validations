require 'spec_helper'

module G5IntegrationsValidations
  describe InventoryCtaValidations do

    let(:klass) { CentershiftInventory }
    subject { klass.new }
    let(:allowed_ctas) { klass::CTAS_THRESHOLD_OPTIONS }

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
