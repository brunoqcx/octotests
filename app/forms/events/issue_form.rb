module Events
  class IssueForm < BaseForm

    def save
      build

      validate
      
      !!(persist if errors.empty?)
    end

    def event
      @event ||= ::IssueEvent.new(event_params)
    end

    private

    def build
      issue.assign_attributes(issue_params.except(:number))
    end

    def validate
      errors.merge!(issue.errors) unless issue.valid?
      errors.merge!(event.errors) unless event.valid?
    end

    def persist
      ActiveRecord::Base.transaction do
        issue.events << event

        issue.save!
      end
    end

    def issue
      @issue ||= ::Issue.find_or_initialize_by(number: issue_params[:number])
    end

    def event_params
      params.require(:event).permit(:action)
    end

    def issue_params
      params.require(:issue).permit(:number, :state)
    end
  end
end
