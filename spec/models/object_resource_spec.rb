# Generated via
#  `rails generate curation_concerns:work ObjectResource`
require 'rails_helper'

describe ObjectResource do
  let(:creator) { Agent.create( label: ['Test Creator'] ) }
  let(:creator_a) { Agent.create( label: ['Creator A'] ) }
  let(:creator_b) { Agent.create( label: ['Creator B'] ) }
  let(:contributor) { Agent.create( label: ['Test Contributor'] ) }
  let(:publisher) { Agent.create( label: ['Test Publisher'] ) }
  let(:topic) { Concept.create( label: ['Test Topic'] ) }
  let(:obj) { described_class.new(title: ['Test Object Resource'], description:  ['Test Description Text']) }
  let(:cre_obj) { described_class.new(title: ['Test Object Resource'], creator: [creator.uri], contributor: [contributor.uri]) }
  let(:pub_obj) { described_class.new(title: ['Test Object Resource - Publisher'], creator: [creator_a.uri], publisher: [publisher.uri]) }
  let(:top_obj) { described_class.new(title: ['Test Object Resource - Topic'], creator: [creator_b.uri], topic: [topic.uri]) }
  let(:phd_obj) { described_class.new(title: ['Test Object Resource - Physical Description'], physical_description: ["Test physical description"]) }

  describe 'Object Resource' do

    it 'should create object resource' do
      obj.save ({:validate => false})
      expect { obj.save }.to_not raise_error
      expect(obj.id).to be_truthy
      @obj = described_class.find obj.id
      expect(@obj.title.first).to eq 'Test Object Resource'
      expect(@obj.description.first).to eq 'Test Description Text'
    end
 
    it 'should has creator and contributor' do
      cre_obj.save ({:validate => false})
      expect { cre_obj.save }.to_not raise_error
      expect(cre_obj.id).to be_truthy
      @obj = described_class.find cre_obj.id
      expect(@obj.title.first).to eq 'Test Object Resource'
      expect(@obj.creator.first.label.first).to eq 'Test Creator'
      expect(@obj.contributor.first.label.first).to eq 'Test Contributor'
    end

    it 'should has publisher' do
      pub_obj.save ({:validate => false})
      expect { pub_obj.save }.to_not raise_error
      expect(pub_obj.id).to be_truthy
      @obj = described_class.find pub_obj.id
      expect(@obj.title.first).to eq 'Test Object Resource - Publisher'
      expect(@obj.creator.first.label.first).to eq 'Creator A'
      expect(@obj.publisher.first.label.first).to eq 'Test Publisher'
    end

    it 'should has topic' do
      top_obj.save ({:validate => false})
      expect { top_obj.save }.to_not raise_error

      expect(top_obj.id).to be_truthy
      @obj = described_class.find top_obj.id
      expect(@obj.title.first).to eq 'Test Object Resource - Topic'
      expect(@obj.creator.first.label.first).to eq 'Creator B'
      expect(@obj.topic.first.label.first).to eq 'Test Topic'
    end

    it 'should has topic' do
      phd_obj.save ({:validate => false})
      expect { phd_obj.save }.to_not raise_error
      expect(phd_obj.id).to be_truthy
      @obj = described_class.find phd_obj.id
      expect(@obj.title.first).to eq 'Test Object Resource - Physical Description'
      expect(@obj.physical_description.first).to eq 'Test physical description'
    end
  end
end
