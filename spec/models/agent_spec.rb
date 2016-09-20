require 'rails_helper'

describe Concept do
  let(:subject) { Agent.new(label: ['Test Agent']) }

  describe '#label' do
    it 'has a label' do
      expect(subject.label).to eq ['Test Agent']
    end
  end
end
