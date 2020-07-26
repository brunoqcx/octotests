module Events
  class BaseForm
    include ActiveModel::Validations

    def initialize(params)
      @params = params
    end

    private

    attr_reader :params

  end
end
