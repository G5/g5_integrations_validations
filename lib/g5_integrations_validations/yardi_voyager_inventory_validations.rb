module G5IntegrationsValidations
  module YardiVoyagerInventoryValidations

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      validates(
        :api_version,
        :database,
        :reasons,
        :interface_entity,
        :platform,
        :server_name,
        :originating_lead_source,
        presence: true
      )
    end
  end
end
