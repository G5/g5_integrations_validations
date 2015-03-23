require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryPresenceValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end

  it { is_expected.to validate_presence_of(:unit_availability_threshold) }

  it { is_expected.to validate_presence_of(:cta_quote_url) }
  it { is_expected.to validate_presence_of(:cta_rent_now_url) }
  it { is_expected.to validate_presence_of(:cta_reserve_url) }
  it { is_expected.to validate_presence_of(:cta_reserve_fee_url) }

  it do
    is_expected.
      to validate_presence_of(:unit_availability_cta_in_and_above_threshold)
  end

  context "conditional validations" do
    context "cta_reserve_fee_url is set" do
      before {allow(subject).to receive(:cta_reserve_fee_url).and_return("something.com")}
      it "allows a cta_reserve_url to be nil if cta_reserve_fee_url is not" do
        is_expected.to_not validate_presence_of(:cta_reserve_url)
      end
    end

    context "cta_reserve_url is set" do
      before {allow(subject).to receive(:cta_reserve_url).and_return("something.com")}
      it "allows a cta_reserve_fee_url to be nil if cta_reserve_url is not" do
        is_expected.to_not validate_presence_of(:cta_reserve_fee_url)
      end
    end
  end


end
