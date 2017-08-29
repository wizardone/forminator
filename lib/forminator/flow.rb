module Forminator
  class Flow
    attr_reader :steps, :current_step

    def initialize(steps:)
      @steps = steps
      @current_step = initial_step
    end

    def next_step
      steps[steps.index(current_step) + 1]
    end

    def previous_step
      # TODO: there is no previous step??
      steps[steps.index(current_step) - 1]
    end

    def initial_step
      steps.first
    end
  end
end
