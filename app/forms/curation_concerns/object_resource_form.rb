# Generated via
#  `rails generate curation_concerns:work ObjectResource`
module CurationConcerns
  class ObjectResourceForm < CurationConcerns::Forms::WorkForm
    self.model_class = ::ObjectResource

    delegate :creator, to: :model
    delegate :contributor, :publisher, to: :model
    delegate :created_date, to: :model
    delegate :event_date, to: :model
    delegate :topic, to: :model
    delegate :spatial, to: :model
    delegate :general_note, :physical_description, to: :model
    delegate :language, to: :model
    delegate :resource_type, to: :model

    self.terms += [:created_date, :event_date, :spatial, :topic, :general_note, :physical_description, :resource_type]

    NESTED_ASSOCIATIONS = [:creator, :contributor, :publisher, :created_date, :event_date, :spatial, :topic].freeze;

    def self.model_attributes(attrs)
      super(attrs)
      convert_to_hash attrs
    end

    protected
      def self.permitted_topic_params
        [:id,
         :_destroy,
        ]
      end

      def self.permitted_agent_params
        [:id,
         :_destroy,
        ]
      end

      def self.permitted_time_span_params
        [:id,
         :_destroy,
         {
           start: [],
           finish: [],
           label: [],
           note: [],
         },
        ]
      end

      def self.permitted_edm_place_params
        [:id,
         :_destroy,
        ]
      end

      def self.build_permitted_params
        permitted = super
        #permitted.delete(creator: [])

        permitted << { creator_attributes: permitted_agent_params }
        permitted << { contributor_attributes: permitted_agent_params }
        permitted << { creator_attributes: permitted_topic_params }
        permitted << { spatial_attributes: permitted_edm_place_params }
        permitted << { created_date_attributes: permitted_time_span_params }
        permitted << { event_date_attributes: permitted_time_span_params }
      end

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
end
