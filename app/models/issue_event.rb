class IssueEvent < Event
  has_one :notification, foreign_key: :event_id
  has_one :issue, through: :notification

  scope :by_issue_number, -> (issue_number) { joins(:notification).merge(Notification.by_issue_number(issue_number)) }
end
