class YardiVoyagerInventory

  include G5IntegrationsValidations::YardiVoyagerInventoryValidations
  include Virtus.model
  attribute :api_version, String
  attribute :database, String
  attribute :interface_entity, String
  attribute :platform, String
  attribute :server_name, String

end
