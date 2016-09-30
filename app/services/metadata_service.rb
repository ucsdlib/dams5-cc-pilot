module MetadataService
  class << self

    # Returns all edm:Agent
    def find_all_agents
      cols = []
      records = ActiveFedora::Base.where('has_model_ssim:Agent')
      records.each do |rec|
        cols << [rec.label.first, RDF::URI(ActiveFedora::Base.id_to_uri(rec.id))]
      end
      cols 
    end

    def find_agents (label)
      recs = []
      q = "has_model_ssim:Agent AND label_tesim:\"#{label}\""
      records = ActiveFedora::Base.where(q)
      records.each do |rec|
        recs << [rec.label.first, RDF::URI(ActiveFedora::Base.id_to_uri(rec.id))]
      end
      recs 
    end

    # Returns all skos:Concept
    def find_all_subjects
      cols = []
      records = ActiveFedora::Base.where('has_model_ssim:Concept')
      records.each do |rec|
        cols << [rec.label.first, RDF::URI(ActiveFedora::Base.id_to_uri(rec.id))]
      end
      cols 
    end

    def local_attribution_list
      values = []
      values << 'Digital Library Development Program, UC San Diego, La Jolla, 92093-0175 (http://libraries.ucsd.edu/about/digital-library/)'
      values << 'Research Data Curation Program, UC San Diego, La Jolla, 92093-0175 (http://libraries.ucsd.edu/services/data-curation/)'
      values << 'Special Collections & Archives, UC San Diego, La Jolla, 92093-0175 (http://libraries.ucsd.edu/collections/sca/)'
      values
    end

    def resource_type_list
      values = []
      values << ["Cartographic", "http://id.loc.gov/vocabulary/resourceTypes/car"]
      values << ["Data", "http://id.loc.gov/vocabulary/resourceTypes/dat"]
      values << ["Mixed material", "http://id.loc.gov/vocabulary/resourceTypes/mix"]
      values << ["Moving image", "http://id.loc.gov/vocabulary/resourceTypes/mov"]
      values << ["Multimedia", "http://id.loc.gov/vocabulary/resourceTypes/mul"]
      values << ["Notated movement", "http://id.loc.gov/vocabulary/resourceTypes/nmv"]
      values << ["Notated music", "http://id.loc.gov/vocabulary/resourceTypes/not"]
      values << ["Software", "http://id.loc.gov/vocabulary/resourceTypes/sof"]
      values << ["Sound recording", "http://id.loc.gov/vocabulary/resourceTypes/aud"]
      values << ["Sound recording-musical", "http://id.loc.gov/vocabulary/resourceTypes/aum"]
      values << ["Sound recording-nonmusical", "http://id.loc.gov/vocabulary/resourceTypes/aun"]
      values << ["Still image", "http://id.loc.gov/vocabulary/resourceTypes/img"]
      values << ["Text", "http://id.loc.gov/vocabulary/resourceTypes/txt"]
      values << ["Three dimensional object", "http://id.loc.gov/vocabulary/resourceTypes/art"]
    end
  end

end
