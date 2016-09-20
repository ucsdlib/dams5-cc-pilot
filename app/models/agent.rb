# Agent is a class in EDM that has possible subclasses of
# See:  http://www.europeana.eu/schemas/edm/Agent
class Agent < ActiveFedora::Base
   extend ActiveTriples::Configurable

  configure type: ::RDF::Vocab::EDM.Agent

  property :label, predicate: ::RDF::Vocab::SKOS.prefLabel
  property :alternate_label, predicate: ::RDF::Vocab::SKOS.altLabel
  property :identifier, predicate: ::RDF::Vocab::DC11.identifier
  property :birth, predicate: ::RDF::Vocab::EDM.begin
  property :dead, predicate: ::RDF::Vocab::EDM.end

  validates :label, allow_blank: false, length: { minimum: 1 }

  def to_solr(solr_doc = {})
    super.tap do |solr_doc|
      solr_doc[Solrizer.solr_name('label', :stored_searchable)] = label
      solr_doc[Solrizer.solr_name('identifier', :stored_searchable)] = identifier if !identifier.blank?
      solr_doc[Solrizer.solr_name('alternate_label', :stored_searchable)] = alternate_label if !alternate_label.blank?
      solr_doc[Solrizer.solr_name('birth', :stored_searchable)] = birth if !birth.blank?
      solr_doc[Solrizer.solr_name('dead', :stored_searchable)] = identifier if !dead.blank?
      solr_doc['uri_ssim'] = uri
    end
  end
end
