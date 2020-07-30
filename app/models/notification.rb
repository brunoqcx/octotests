class Notification < ApplicationRecord
  belongs_to :issue
  belongs_to :event

  scope :by_issue_number, -> (issue_number) { joins(:issue).merge(Issue.by_number(issue_number)) }
end
