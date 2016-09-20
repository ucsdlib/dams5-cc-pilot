class WorkIndexer < CurationConcerns::WorkIndexer

  # date: TimeSpan
  DATE = Solrizer.solr_name('date', :stored_searchable)
  CREATED_DATE = Solrizer.solr_name('created_date', :stored_searchable)
  EVENT_DATE = Solrizer.solr_name('event_date', :stored_searchable)
  COLLECTION_DATE = Solrizer.solr_name('collection_date', :stored_searchable)
  COPYRIGHT_DATE = Solrizer.solr_name('date_copyrighted', :stored_searchable)
  ISSUE_DATE = Solrizer.solr_name('issue_date', :stored_searchable)

  SORTABLE_DATE = Solrizer.solr_name('date', :sortable)

  def generate_solr_document
    super.tap do |solr_doc|

      # creator: Agent
      object.creator.each do |cre|
        val = agent_label cre
        facet_searchable solr_doc, 'creator', val
      end

      # contributor: Agent
      object.contributor.each do |contr|
        val = agent_label contr
        facet_searchable solr_doc, 'contributor', val
      end

      # publisher: Agent
      object.publisher.each do |pub|
        val = agent_label  pub
        facet_searchable solr_doc, 'publisher', val
      end

      # topic: Concept
      object.topic.each do |top|
        val = subject_label top
        facet_searchable solr_doc, 'topic', val
      end

      # spatial: EdmPlace
      solr_doc[Solrizer.solr_name('spatial', :facetable)] = spatial
      solr_doc[Solrizer.solr_name('spatial', :stored_searchable)] = spatial

      solr_doc[DATE] = display_date('date')
      solr_doc[CREATED_DATE] = created_date
      solr_doc[EVENT_DATE] = display_date('event_date')
      solr_doc[COLLECTION_DATE] = display_date('collection_date')
      solr_doc[COPYRIGHT_DATE] = display_date('copyright_date')
      solr_doc[ISSUE_DATE] = display_date('issue_date')
    end
  end

  private

    def facet_searchable (solr_doc, field_name, val)
      Solrizer.insert_field(solr_doc, field_name, val, :facetable)
      Solrizer.insert_field(solr_doc, field_name, val, :stored_searchable)
    end

    def agent_label (obj)
      return if obj.nil?
      if obj.is_a? Agent
        obj.label
      else
        Agent.find(obj.split("/")[-1]).label
      end
    end

    def subject_label (obj)
      return if obj.nil?
      if obj.is_a? Concept
        obj.label
      else
        Concept.find(obj.split("/")[-1]).label
      end
    end

    def display_date(date_name)
      Array(object[date_name]).map(&:display_label)
    end

    def created_date
      return unless object.created_date.present?
      object.created_date.first.display_label
    end

    def spatial
      return unless object.spatial.present?
      object.spatial.first.label
    end
end
