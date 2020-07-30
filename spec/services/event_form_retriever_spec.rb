RSpec.describe EventFormRetriever, type: :service do
  describe '#call' do
    subject { described_class.new(type).call }

    context 'providing a invalid type' do
      let(:type) { ['blah'].sample }

      it { is_expected.to eq(Events::BaseForm) }
    end

    context 'providing a valid type' do
      let(:type) { ['issues'].sample }

      it { is_expected.to eq(Events::IssueForm) }
    end
  end
end
