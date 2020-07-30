module Events
  class BaseForm
    include ActiveModel::Model

    def initialize(params)
      @params = params
    end

    def save
      errors.add(:base, :invalid_event)

      false
    end

    def event;end

    private

    attr_reader :params

  end
end
