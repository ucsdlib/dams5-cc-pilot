# Agent is a class in EDM that has possible subclasses of
# See:  http://www.europeana.eu/schemas/edm/Agent
class Agent < ActiveFedora::Base
   extend ActiveTriples::Configurable
   include ActiveModel::Validations

  configure type: ::RDF::Vocab::EDM.Agent

  property :label, predicate: ::RDF::Vocab::SKOS.prefLabel
  property :alternate_label, predicate: ::RDF::Vocab::SKOS.altLabel
  property :identifier, predicate: ::RDF::Vocab::DC11.identifier
  property :birth, predicate: ::RDF::Vocab::EDM.begin
  property :dead, predicate: ::RDF::Vocab::EDM.end

  # xsd:anyURI
  property :close_match, predicate: ::RDF::Vocab::SKOS.closeMatch, multiple: false
  property :related_match, predicate: ::RDF::Vocab::SKOS.relatedMatch, multiple: false

  validates :label, presence: { message: 'field is required.'}
  validates :close_match, url: true, allow_blank: true
  validates :related_match, url: true, allow_blank: true

  def to_solr(solr_doc = {})
    super.tap do |solr_doc|
      solr_doc[Solrizer.solr_name('label', :stored_searchable)] = label
      solr_doc[Solrizer.solr_name('alternate_label', :stored_searchable)] = alternate_label if !alternate_label.blank?
      solr_doc[Solrizer.solr_name('close_match', :stored_searchable)] = close_match if !close_match.blank?
      solr_doc[Solrizer.solr_name('related_match', :stored_searchable)] = related_match if !related_match.blank?
      solr_doc['uri_ssim'] = uri
    end
  end
end
