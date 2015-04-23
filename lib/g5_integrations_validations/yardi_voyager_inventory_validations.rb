module G5IntegrationsValidations
  module YardiVoyagerInventoryValidations

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      validates(
        :api_version,
        :database,
        :interface_entity,
        :platform,
        :server_name,
        presence: true
      )
    end
  end
end
