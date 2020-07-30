require 'rails_helper'

RSpec.describe IssueEvent, type: :model do

  context "Relationships" do
    it { is_expected.to have_one(:notification) }
    it { is_expected.to have_one(:issue) }
  end
end
