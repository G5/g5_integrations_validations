require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end
  it { is_expected.to validate_presence_of(:unit_availability_threshold) }

  describe "#in_store_rate_percentage" do
    context "is calculated from web rate" do
      subject do
        SiteLinkInventory.new(in_store_rate_basis: 'calculated_from_web_rate')
      end
      it { is_expected.to validate_presence_of(:in_store_rate_percentage) }
      it do
        is_expected.to validate_numericality_of(:in_store_rate_percentage).
          is_greater_than_or_equal_to(0)
      end
    end

    context "is not calculated from web rate" do
      subject { SiteLinkInventory.new(in_store_rate_basis: 'push_rate') }
      it { is_expected.not_to validate_presence_of(:in_store_rate_percentage) }
      it do
        is_expected.not_to validate_numericality_of(:in_store_rate_percentage).
          is_greater_than_or_equal_to(0)
      end
    end
  end

  describe "#web_rate_discount" do
    context "is calculated from in-store rate" do
      subject do
        SiteLinkInventory.new(web_rate_basis: 'calculated_from_in_store_rate')
      end
      it do
        is_expected.to validate_numericality_of(:web_rate_discount).
          is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100)
      end
    end

    context "is not calculated from in-store rate" do
      subject { SiteLinkInventory.new(web_rate_basis: 'push_rate') }
      it { is_expected.not_to  validate_presence_of(:web_rate_discount) }
      it do
        is_expected.not_to validate_inclusion_of(:web_rate_discount).in_range(0..100)
      end
    end
  end

  describe "web rate basis" do
    context "in_store_rate_basis is not set" do
      subject { SiteLinkInventory.new(in_store_rate_basis: nil) }
      it { is_expected.to validate_presence_of(:web_rate_basis) }
    end

    context "in_store_rate_basis is set" do
      subject { SiteLinkInventory.new(in_store_rate_basis: "standard_rate") }
      it { is_expected.to_not validate_presence_of(:web_rate_basis) }
    end

    it do
      is_expected.to validate_inclusion_of(:web_rate_basis).
        in_array(%w(push_rate standard_rate calculated_from_in_store_rate)).
        allow_nil(true)
    end

    context "in_store_rate_basis is calculated_from_web_rate" do
      subject do
        SiteLinkInventory.new(in_store_rate_basis: "calculated_from_web_rate")
      end

      it do
        is_expected.to validate_exclusion_of(:web_rate_basis).
          in_array(%w(calculated_from_in_store_rate)).
          with_message("cannot be the in-store rate because the in-store rate is not set or is based on the web rate")
      end

      it { is_expected.to validate_presence_of(:web_rate_basis) }
    end

    context "in_store_rate_basis is nil" do
      subject { SiteLinkInventory.new(in_store_rate_basis: nil) }

      it do
        is_expected.to validate_exclusion_of(:web_rate_basis).
          in_array(%w(calculated_from_in_store_rate)).
          with_message("cannot be the in-store rate because the in-store rate is not set or is based on the web rate")
      end
    end

    context "in_store_rate_basis is not calculated_from_web_rate" do
      subject do
        SiteLinkInventory.new(in_store_rate_basis: "push_rate")
      end

      it do
        is_expected.to_not validate_exclusion_of(:web_rate_basis).
          in_array(%w(calculated_from_in_store_rate))
      end
    end
  end

  describe "in-store rate basis" do
    it do
      is_expected.to validate_inclusion_of(:in_store_rate_basis).
        in_array(%w(push_rate standard_rate calculated_from_web_rate))
    end

    it { is_expected.to validate_presence_of(:in_store_rate_basis) }

    context "web_rate_basis is calculated_from_in_store_rate" do
      subject do
        SiteLinkInventory.new(web_rate_basis: "calculated_from_in_store_rate")
      end

      it do
        is_expected.to validate_exclusion_of(:in_store_rate_basis).
          in_array(%w(calculated_from_web_rate)).
          with_message("cannot be the web rate because the web rate is not set or is based on the in-store rate")
      end

      it  { is_expected.to validate_presence_of(:in_store_rate_basis) }
    end

    context "web_rate_basis is nil" do
      subject { SiteLinkInventory.new(web_rate_basis: nil) }

      it do
        is_expected.to validate_exclusion_of(:in_store_rate_basis).
          in_array(%w(calculated_from_web_rate)).
          with_message("cannot be the web rate because the web rate is not set or is based on the in-store rate")
      end
    end

    context "web_rate_basis is not calculated_from_in_store_rate" do
      subject do
        SiteLinkInventory.new(web_rate_basis: "push_rate")
      end

      it do
        is_expected.to_not validate_exclusion_of(:in_store_rate_basis).
          in_array(%w(calculated_from_web_rate))
      end
    end
  end

  it { is_expected.to validate_presence_of(:cta_reserve_url) }

  context "cta_reserve_url" do
    context "unit_availability_cta_below_threshold is not quote" do
      subject do
        SiteLinkInventory.new(unit_availability_cta_below_threshold: "reserve")
      end
      it { is_expected.to_not validate_presence_of(:cta_quote_url) }
    end

    context "unit_availability_cta_below_threshold is quote" do
      subject do
        SiteLinkInventory.new(unit_availability_cta_below_threshold: "quote")
      end
      it { is_expected.to validate_presence_of(:cta_quote_url) }
    end
  end

  it do
    is_expected.
      to validate_presence_of(:unit_availability_cta_in_and_above_threshold)
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_in_and_above_threshold).
      in_array(%w(quote reserve))
  end
  it do
    is_expected.
      to validate_inclusion_of(:unit_availability_cta_below_threshold).
      in_array(%w(call quote))
  end

end
