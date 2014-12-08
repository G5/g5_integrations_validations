require "spec_helper"

describe G5IntegrationsValidations::SiteLinkLeadValidations do

  subject { SiteLinkLead.new }
  it do
    is_expected.to validate_inclusion_of(:charge_mode).
      in_array(%w(test charge do_not_charge))
  end

end
