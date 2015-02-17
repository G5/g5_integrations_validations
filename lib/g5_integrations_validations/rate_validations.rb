module G5IntegrationsValidations
  module RateValidations

    def self.model(options={})
      mod = Module.new do
        mattr_accessor :g5_integrations_validations_rate_options

        def self.included(base)
          base.class_attribute :g5_integrations_validations_rate_options
          base.g5_integrations_validations_rate_options =
            self.g5_integrations_validations_rate_options
          base.send :include, RateValidations
        end
      end

      mod.g5_integrations_validations_rate_options = options

      mod
    end

    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations

      validates(:in_store_rate_percentage, {
        presence: true,
        numericality: {greater_than_or_equal_to: 0},
        if: -> (o) { o.in_store_rate_basis == 'calculated_from_web_rate' },
      })
      validates(:web_rate_discount, {
        numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100},
        if: -> (o) { o.web_rate_basis == 'calculated_from_in_store_rate' },
      })
      validates(:web_rate_basis, {
        inclusion: {
          in: g5_integrations_validations_rate_options[:web_rate_bases],
          allow_blank: true,
        },
      })
      validates(:web_rate_basis, {
        presence: true,
        exclusion: {
          in: %w(calculated_from_in_store_rate),
          message: "cannot be the in-store rate because the in-store rate is not set or is based on the web rate",
        },
        if: -> (o) do
          o.in_store_rate_basis == 'calculated_from_web_rate' ||
            o.in_store_rate_basis.nil?
        end,
      })
      validates(:in_store_rate_basis, {
        presence: true,
        inclusion: {
          in: g5_integrations_validations_rate_options[:in_store_rate_bases]
        },
      })
      validates(:in_store_rate_basis, {
        exclusion: {
          in: %w(calculated_from_web_rate),
          message: "cannot be the web rate because the web rate is not set or is based on the in-store rate",
        },
        if: -> (o) do
          o.web_rate_basis == 'calculated_from_in_store_rate' ||
            o.web_rate_basis.blank?
        end,
      })
    end

  end
end
