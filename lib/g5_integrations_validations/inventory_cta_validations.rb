module G5IntegrationsValidations
  module InventoryCtaValidations

    def self.model(options={})
      mod = Module.new do
        mattr_accessor :g5_integrations_validations_inventory_cta_options

        def self.included(base)
          base.class_attribute\
            (:g5_integrations_validations_inventory_cta_options)
          base.g5_integrations_validations_inventory_cta_options =
            self.g5_integrations_validations_inventory_cta_options
          base.send :include, InventoryCtaValidations
        end
      end

      mod.g5_integrations_validations_inventory_cta_options = options

      mod
    end

    extend ActiveSupport::Concern

    included do
      ctas = g5_integrations_validations_inventory_cta_options[:ctas]
      validates(:unit_availability_cta_in_and_above_threshold, {
        presence: true,
        inclusion: {in: ctas},
      })
      validates(:unit_availability_cta_below_threshold, {
        inclusion: {in: ctas},
        presence: true,
      })
      validates(:unit_availability_cta_2_in_and_above_threshold, {
        inclusion: {in: ctas},
        allow_blank: true
      })
      validates(:unit_availability_cta_2_below_threshold, {
        inclusion: {in: ctas},
        allow_blank: true
      })

    end

  end
end
