require "spec_helper"

module G5IntegrationsValidations
  describe YardiVoyagerInventoryValidations do

    subject { YardiVoyagerInventory.new }

    it { is_expected.to validate_presence_of(:api_version) }
    it { is_expected.to validate_presence_of(:database) }
    it { is_expected.to validate_presence_of(:interface_entity) }
    it { is_expected.to validate_presence_of(:platform) }
    it { is_expected.to validate_presence_of(:server_name) }
    it { is_expected.to validate_presence_of(:cta_reservation_url) }

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
        to validate_inclusion_of(:starting_rate_source).
        in_array(%w(vendor_starting_rate))
    end

    it do
      is_expected.
        to validate_inclusion_of(:starting_rate_source).
        in_array(%w(available_starting_rate))
    end

    it { is_expected.to validate_presence_of(:rate_to_display) }
    it do
      is_expected.to validate_inclusion_of(:rate_to_display).
        in_array(YardiVoyagerInventoryRateToDisplayValidations::VALID_OPTIONS)
    end
  end
end
