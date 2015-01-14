require "spec_helper"

describe G5IntegrationsValidations::SiteLinkLeadRentNowValidations do

  subject { SiteLinkLeadRentNow.new }
  it do
    is_expected.to validate_numericality_of(:max_move_in_days_from_now).
      is_greater_than(0)
  end

end
