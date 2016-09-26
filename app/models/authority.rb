# Authority is super class that has possible subclasses
class Authority < ActiveFedora::Base
   extend ActiveTriples::Configurable
   include ActiveModel::Validations

  property :label, predicate: ::RDF::Vocab::SKOS.prefLabel
  property :alternate_label, predicate: ::RDF::Vocab::SKOS.altLabel

  validates :label, presence: { message: 'Label is required.' }
  validates_with LabelExistsValidator

  def self.is_authority?(record)
    record.is_a?(Authority) || record.class.ancestors.include?(Authority) || record.is_a?(Agent) || record.is_a?(Concept)
  end

  def to_solr(solr_doc = {})
    super.tap do |solr_doc|
      solr_doc[Solrizer.solr_name('label', :stored_searchable)] = label
      solr_doc[Solrizer.solr_name('alternate_label', :stored_searchable)] = alternate_label if !alternate_label.blank?
      solr_doc['uri_ssim'] = uri
    end
  end
end
