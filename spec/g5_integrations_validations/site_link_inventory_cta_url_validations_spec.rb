require "spec_helper"

describe G5IntegrationsValidations::SiteLinkInventoryCtaUrlValidations do

  subject do
    SiteLinkInventory.new(
      in_store_rate_basis: "standard_rate",
      web_rate_basis: "push_rate",
    )
  end

  it { is_expected.to validate_presence_of(:cta_inquiry_url) }
  it { is_expected.to validate_presence_of(:cta_rent_now_url) }
  it { is_expected.to validate_presence_of(:cta_reservation_url) }
  it { is_expected.to validate_presence_of(:cta_reservation_with_fee_url) }

  context "conditional validations" do
    context "cta_reservation_with_fee_url is set" do
      before {allow(subject).to receive(:cta_reservation_with_fee_url).and_return("something.com")}
      it "allows a cta_reservation_url to be nil if cta_reservation_with_fee_url is not" do
        is_expected.to_not validate_presence_of(:cta_reservation_url)
      end
    end

    context "cta_reservation_url is set" do
      before {allow(subject).to receive(:cta_reservation_url).and_return("something.com")}
      it "allows a cta_reservation_with_fee_url to be nil if cta_reservation_url is not" do
        is_expected.to_not validate_presence_of(:cta_reservation_with_fee_url)
      end
    end
  end


end
