class YardiVoyagerInventory

  include G5IntegrationsValidations::YardiVoyagerInventoryValidations
  include Virtus.model
  attribute :api_version, String
  attribute :database, String
  attribute :reasons, String
  attribute :interface_entity, String
  attribute :platform, String
  attribute :server_name, String
  attribute :originating_lead_source, String

end
