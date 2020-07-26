require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of(:action) }
    it { is_expected.to validate_presence_of(:type) }
  end

end