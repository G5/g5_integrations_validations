module G5IntegrationsValidations
  module MultiFamilyInventoryRateSourceValidations
    extend ActiveSupport::Concern

    RATE_SOURCE = %w(vendor_rate available_rate)

    included do
      include ActiveModel::Validations

      validates(:rate_source, {
        inclusion: {in: RATE_SOURCE}
      })
    end
  end

end
