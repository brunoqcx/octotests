require 'rails_helper'

RSpec.describe Notification, type: :model do

  context "Relationships" do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:issue) }
  end
end
