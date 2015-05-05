module G5IntegrationsValidations
  module YardiVoyagerInventoryCtaThresholdValidations
    extend ActiveSupport::Concern

    CTAS_FOR_IN_AND_ABOVE_THRESHOLD = %w(reservation)
    CTAS_FOR_BELOW_THRESHOLD = %w(call)

    included do
      include ActiveModel::Validations

      validates(:unit_availability_cta_in_and_above_threshold, {
        inclusion: {in: CTAS_FOR_IN_AND_ABOVE_THRESHOLD}
      })

      validates(:unit_availability_cta_below_threshold, {
        inclusion: {in: CTAS_FOR_BELOW_THRESHOLD}
      })

    end
  end

end
