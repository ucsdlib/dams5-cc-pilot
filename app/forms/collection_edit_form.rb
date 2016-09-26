class CollectionEditForm < CurationConcerns::Forms::CollectionEditForm

  self.terms += [:brief_description, :general_note, :location_of_originals, :table_of_contents]
  self.terms += [:spatial, :topic, :created_date, :extent, :local_attribution, :finding_aid, :exhibit, :format]
  delegate :spatial, to: :model
  delegate :topic, to: :model
  delegate :creator, to: :model
  delegate :created_date, to: :model
  delegate :extent, :local_attribution, :finding_aid, :exhibit, to: :model
  delegate :brief_description, :general_note, :location_of_originals, :format, :table_of_contents, to: :model


  def self.model_attributes(attrs)
    attrs[:title] = Array(attrs[:title]) if attrs[:title]
    super(attrs)
    convert_to_hash JSON.parse(attrs.to_json)
  end

  def initialize_fields
    super
  end

  def title
    self[:title].first
  end

  protected
    def self.convert_to_hash (attrs)
      attrs.each do |key, value|
        if value.is_a? Array
          value.map! { |v| to_hash(v) }
        else
          to_hash(value)
        end
      end
    end

    def self.to_hash(val)
      begin
        val.start_with?(ActiveFedora.fedora.host) ? ActiveFedora::Base.find(ActiveFedora::Base.uri_to_id(val)).uri : val
      rescue
        val
      end
    end
end
