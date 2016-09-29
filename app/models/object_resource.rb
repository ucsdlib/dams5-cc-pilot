# Generated via
#  `rails generate curation_concerns:work ObjectResource`
class ObjectResource < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  include ::CommonMetadata

  include NestedAttributes
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []

  validates :title, presence: { message: 'Title is required.' }
  validates :language, url: true, allow_blank:true

  def self.indexer
    ::WorkIndexer
  end

end
