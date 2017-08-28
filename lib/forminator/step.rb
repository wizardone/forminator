require 'hanami/validations'

module Forminator

  class InvalidStep < StandardError; end

  class Step

    include ::Hanami::Validations

    attr_reader :params, :object

    def self.call(object, params)
      step = new(params)
      validity = step.valid?
      if validity && step.persist?
        step.persist(object: object)
      end

      [validity, params]
    end

    def valid?
      validate.success?
    end

    def persist?
      false
    end

    def persist(object:, method: nil)
      method&.call(object) || Forminator.config.persist.call(object)
    end
  end
end
