class ObjectResourceShowPresenter < CurationConcerns::WorkShowPresenter
  delegate :topic, to: :solr_document
  delegate :creator, :contributor, :publisher, to: :solr_document
  delegate :created_date, :event_date, to: :solr_document
  delegate :spatial, to: :solr_document
  delegate :general_note, :physical_description, to: :solr_document
  delegate :resource_type, :language, to: :solr_document

end
