require "spec_helper"

module G5IntegrationsValidations
  describe YardiVoyagerInventoryValidations do

    subject { YardiVoyagerInventory.new }

    it { is_expected.to validate_presence_of(:api_version) }
    it { is_expected.to validate_presence_of(:database) }
    it { is_expected.to validate_presence_of(:reasons) }
    it { is_expected.to validate_presence_of(:interface_entity) }
    it { is_expected.to validate_presence_of(:platform) }
    it { is_expected.to validate_presence_of(:server_name) }
    it { is_expected.to validate_presence_of(:originating_lead_source) }

  end
end
