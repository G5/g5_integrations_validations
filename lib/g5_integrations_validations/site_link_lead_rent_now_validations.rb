module G5IntegrationsValidations::SiteLinkLeadRentNowValidations

  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations

    validates :max_move_in_days_from_now, numericality: { greater_than: 0 }
  end

end
