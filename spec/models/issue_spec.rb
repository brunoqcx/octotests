require 'rails_helper'

RSpec.describe Issue, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_uniqueness_of(:number) }
  end

  context "Relationships" do
    it { is_expected.to have_many(:notifications) }
    it { is_expected.to have_many(:events) }
  end
end
