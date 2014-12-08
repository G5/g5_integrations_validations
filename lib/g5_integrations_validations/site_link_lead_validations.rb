module G5IntegrationsValidations::SiteLinkLeadValidations

  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations
    VALID_CHARGE_MODES = %w(test charge do_not_charge)

    validates :charge_mode, inclusion: {in: VALID_CHARGE_MODES}
  end

end
