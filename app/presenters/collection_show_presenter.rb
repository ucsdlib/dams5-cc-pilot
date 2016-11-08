class CollectionShowPresenter < CurationConcerns::CollectionPresenter
  delegate :spatial, :topic, :created_date, :publisher, to: :solr_document
  delegate :brief_description, :general_note, :location_of_originals, :table_of_contents, to: :solr_document
  delegate :finding_aid, :exhibit, :language, :resource_type, :local_attribution, :extent, to: :solr_document

end
