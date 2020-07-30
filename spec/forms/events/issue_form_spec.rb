require 'rails_helper'

RSpec.describe Events::IssueForm do
  subject { described_class.new(params) }
  let(:params) { ActionController::Parameters.new(params_hash) }

  context 'providing no params' do
    subject { described_class.new }

    it { expect { subject }.to raise_error(ArgumentError) }
  end

  context 'providing invalid params' do
    
    context 'providing empty params' do
      let(:params_hash) { {} }

      it 'does not perform save' do
        expect { subject.save }.to raise_error(ActionController::ParameterMissing)
      end
  
      it  'has no associated event' do
        expect { subject.event }.to raise_error(ActionController::ParameterMissing)
      end

      context 'providing empty issue param' do
        let(:params_hash) { { event: { action: "opened" } } }
  
        it 'does not perform save' do
          expect { subject.save }.to raise_error(ActionController::ParameterMissing)
        end
    
        it  'has an associated not persisted event' do
          expect(subject.event.persisted?).to be_falsy
        end
      end
    end
  end

  context 'providing valid params' do
    let(:params_hash) do 
      {
        action: :create, 
        issue: {
          url: "https://api.github.com/repos/octocat/Hello-World/issues/1347", 
          number: 1347,
          state: "bleehh"
        }, 
        controller: "events", 
        event: {
          action: "opened"
        }
      }
    end

    it 'performs save' do
      expect(subject.save).to be_truthy
    end

    it  'has an associated event' do
      expect(subject.event).to be_present
    end
  end
end
