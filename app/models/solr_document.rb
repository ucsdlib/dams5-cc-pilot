# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  # Adds CurationConcerns behaviors to the SolrDocument.
  include CurationConcerns::SolrDocumentBehavior
  include Blacklight::Gallery::OpenseadragonSolrDocument


  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models. 

  use_extension( Hydra::ContentNegotiation )

 def topic
   self[Solrizer.solr_name('topic')]
  end

  def brief_description
   self[Solrizer.solr_name('brief_description')]
  end

  def creator
    self[Solrizer.solr_name('creator')]
  end

  def contributor
    self[Solrizer.solr_name('contributor')]
  end

  def publisher
    self[Solrizer.solr_name('publisher')]
  end

  def created_date
    self[Solrizer.solr_name('created_date')]
  end

  def event_date
    self[Solrizer.solr_name('event_date')]
  end

  def spatial
    self[Solrizer.solr_name('spatial')]
  end

  def location
    self[Solrizer.solr_name('location')]
  end

  def general_note
    self[Solrizer.solr_name('general_note')]
  end

  def physical_description
    self[Solrizer.solr_name('physical_description')]
  end
end
