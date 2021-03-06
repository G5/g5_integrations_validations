require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end

  it "includes cta validations" do
    expect(subject.class < G5IntegrationsValidations::InventoryCtaValidations).
      to be true
  end

  let(:allowed_ctas) { subject.class::CTAS_THRESHOLD_OPTIONS }

  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
      in_array(allowed_ctas)
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_below_threshold).
      in_array(allowed_ctas)
  end

  describe "unit_availability_cta_in_and_above_threshold" do
    context "unit_cta_availability_threshold is < 1" do
      subject do
        SiteLinkInventory.new(
          unit_availability_cta_in_and_above_threshold: "rent_now",
          unit_cta_availability_threshold: 0,
        )
      end

      specify do
        is_expected.to validate_numericality_of(:unit_cta_availability_threshold).
          is_greater_than_or_equal_to(1).
          with_message("must be greater than or equal to 1 when the `rent_now` CTA is chosen")
      end
    end

    context "unit_cta_availability_threshold is >= 1" do
      subject do
        SiteLinkInventory.new(
          unit_availability_cta_in_and_above_threshold: "rent_now",
          unit_cta_availability_threshold: 1,
        )
      end

      specify do
        is_expected.
          to_not validate_numericality_of(:unit_cta_availability_threshold)
      end
    end
  end

end
