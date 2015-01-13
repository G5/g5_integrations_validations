class YardiVoyagerLead

  include G5IntegrationsValidations::YardiVoyagerLeadValidations
  include Virtus.model
  attribute :api_version, String
  attribute :database, String
  attribute :initial_activity_type, String
  attribute :interface_entity, String
  attribute :platform, String
  attribute :server_name, String
  attribute :source_name, String

end
