require "spec_helper"

describe G5IntegrationsValidations::RateValidations do

  let(:inventory_validations) do
    G5IntegrationsValidations::SiteLinkInventoryValidations
  end

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end

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
      let(:in_store_rate_basis) do
        inventory_validations::VALID_IN_STORE_RATE_BASES.reject do |basis|
          basis == "calculated_from_web_rate"
        end.sample
      end
      subject { SiteLinkInventory.new(in_store_rate_basis: in_store_rate_basis) }
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
      let(:web_rate_basis) do
        inventory_validations::VALID_WEB_RATE_BASES.reject do |basis|
          basis == "calculated_from_in_store_rate"
        end.sample
      end
      subject { SiteLinkInventory.new(web_rate_basis: web_rate_basis) }
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
      let(:in_store_rate_basis) do
        inventory_validations::VALID_IN_STORE_RATE_BASES.reject do |basis|
          basis == "calculated_from_web_rate"
        end.sample
      end
      subject { SiteLinkInventory.new(in_store_rate_basis: in_store_rate_basis) }
      it { is_expected.to_not validate_presence_of(:web_rate_basis) }
    end

    it do
      is_expected.to validate_inclusion_of(:web_rate_basis).
        in_array(inventory_validations::VALID_WEB_RATE_BASES).
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
      let(:in_store_rate_basis) do
        inventory_validations::VALID_IN_STORE_RATE_BASES.reject do |basis|
          basis == "calculated_from_web_rate"
        end.sample
      end
      subject { SiteLinkInventory.new(in_store_rate_basis: in_store_rate_basis) }

      it do
        is_expected.to_not validate_exclusion_of(:web_rate_basis).
          in_array(%w(calculated_from_in_store_rate))
      end
    end
  end

  describe "in-store rate basis" do
    it do
      is_expected.to validate_inclusion_of(:in_store_rate_basis).
        in_array(inventory_validations::VALID_IN_STORE_RATE_BASES)
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

    context "web_rate_basis is blank" do
      subject do
        SiteLinkInventory.new(
          web_rate_basis: "",
          in_store_rate_basis: "standard_rate"
        )
      end

      it do
        is_expected.to validate_exclusion_of(:in_store_rate_basis).
          in_array(%w(calculated_from_web_rate)).
          with_message("cannot be the web rate because the web rate is not set or is based on the in-store rate")
      end
    end

    context "web_rate_basis is not calculated_from_in_store_rate" do
      let(:web_rate_basis) do
        inventory_validations::VALID_WEB_RATE_BASES.reject do |basis|
          basis == "calculated_from_in_store_rate"
        end.sample
      end
      subject { SiteLinkInventory.new(web_rate_basis: web_rate_basis) }

      it do
        is_expected.to_not validate_exclusion_of(:in_store_rate_basis).
          in_array(%w(calculated_from_web_rate))
      end
    end
  end


end
