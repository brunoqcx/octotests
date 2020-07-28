module Events
  class IssueForm < BaseForm
    def save
      # on transaction
      # try save event
      # associate or create issue using has many through relation type
      # end transaction

      # errors.empty

      true #TODO correctly implements
    end

    def event
      params
      # @event ||= IssueEvent.new(create_params) #TODO correctly implements
    end

    private

    def create_params
      params #TODO apply require and permits
    end
  end
end
