module G5IntegrationsValidations
  module YardiVoyagerInventoryRateSourceValidations
    extend ActiveSupport::Concern

    STARTING_RATE_SOURCE = %w(vendor_starting_rate available_starting_rate)

    included do
      include ActiveModel::Validations

      validates(:rate_source, {
        inclusion: {in: STARTING_RATE_SOURCE}
      })
    end
  end

end
