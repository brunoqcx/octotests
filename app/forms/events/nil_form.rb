module Events
  class NilForm < BaseForm
    def save
      errors.add(:base, :invalid_event)

      false
    end
  end
end
