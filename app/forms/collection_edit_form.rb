class CollectionEditForm < CurationConcerns::Forms::CollectionEditForm

  self.terms += [:brief_description, :general_note, :location_of_originals, :table_of_contents]
  self.terms += [:topic, :created_date, :extent, :local_attribution, :finding_aid, :exhibit, :format]
  delegate :topic, to: :model
  delegate :creator, to: :model
  delegate :created_date, to: :model
  delegate :extent, :local_attribution, :finding_aid, :exhibit, to: :model
  delegate :brief_description, :general_note, :location_of_originals, :format, :table_of_contents, to: :model


  def self.model_attributes(attrs)
    attrs[:title] = Array(attrs[:title]) if attrs[:title]
    super(attrs)
  end

  def initialize_fields
    super
  end

  def title
    self[:title].first
  end

end
