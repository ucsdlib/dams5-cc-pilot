require 'rails_helper'

describe Concept do
  let(:subject) { Concept.new(label: ['Test Concept']) }

  describe '#label' do
    it 'has a label' do
      expect(subject.label).to eq ['Test Concept']
    end
  end
end
