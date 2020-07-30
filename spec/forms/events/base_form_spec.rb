require 'rails_helper'

RSpec.describe Events::BaseForm do
  subject { described_class.new(params) }

  context 'providing no params' do
    subject { described_class.new }

    it { expect { subject }.to raise_error(ArgumentError) }
  end

  context 'providing params' do
    let(:params) { {} }

    it 'does not perform save' do
      expect(subject.save).to be_falsy
    end

    it  'has no associated event' do
      expect(subject.event).to be_nil
    end
  end
end
