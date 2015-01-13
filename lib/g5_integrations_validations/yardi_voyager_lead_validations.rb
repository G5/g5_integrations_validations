module G5IntegrationsValidations
  module YardiVoyagerLeadValidations

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
      validates(
        :api_version,
        :database,
        :initial_activity_type,
        :interface_entity,
        :platform,
        :server_name,
        :source_name,
        presence: true
      )
    end

  end
end
