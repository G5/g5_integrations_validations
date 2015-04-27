module G5IntegrationsValidations
  module YardiVoyagerInventoryValidations

    CTAS_FOR_IN_AND_ABOVE_THRESHOLD = %w(reservation)
    CTAS_FOR_BELOW_THRESHOLD = %w(call)

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      validates(
        :api_version,
        :database,
        :interface_entity,
        :platform,
        :server_name,
        :cta_reservation_url,
        presence: true
      )

      validates(:unit_availability_cta_in_and_above_threshold, {
        inclusion: {in: CTAS_FOR_IN_AND_ABOVE_THRESHOLD}
      })

      validates(:unit_availability_cta_below_threshold, {
        inclusion: {in: CTAS_FOR_BELOW_THRESHOLD}
      })
    end
  end
end
