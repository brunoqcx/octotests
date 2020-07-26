class Event < ApplicationRecord
  validates_presence_of :action, :type
end
