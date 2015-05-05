module G5IntegrationsValidations
  module YardiVoyagerInventoryRateToDisplayValidations
    extend ActiveSupport::Concern

    VALID_OPTIONS = %w(starting_rate starting_and_ending_rates none)

    included do
      include ActiveModel::Validations

      validates(:rate_to_display, {
        inclusion: {in: VALID_OPTIONS},
        presence: true,
      })
    end
  end

end
