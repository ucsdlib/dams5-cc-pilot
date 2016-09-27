module AuthoritiesHelper
  # @field
  # @values
  # @options
  # Render HTML for attributes
  def render_attribute (field, values, options = {})
    renderer = ::CurationConcerns::Renderers::AttributeRenderer.new field, values, options
    renderer.render
  end

  # @field
  # @values
  # @options
  # Render HTML for authority attributes
  def render_authority_attribute (field, values, options = {})
    renderer = AuthorityAttributeRenderer.new field, values, options
    renderer.render
  end

  def convert_url_to_hash(value)
    if value.is_a? ActiveTriples::Relation
      values = []
      value.each { |v|
        v = v.id if v.respond_to?(:id)
        if (v.to_s.start_with?(ActiveFedora.fedora.host) && ActiveFedora::Base.exists?(ActiveFedora::Base.uri_to_id(v)))
            values << ActiveFedora::Base.find(ActiveFedora::Base.uri_to_id(v))
        else
          values << v
        end
      }
      value.clear.push values
    end
  end

  # @value
  # Extract uri from the authority hash
  def hash_to_uri(value)
    if value.is_a? ActiveTriples::Relation
      values = []
      value.map { |x|
        if Authority.is_authority? x
          values << x.uri.to_s
        elsif (x.is_a? ActiveTriples::Resource) && !(x.is_a? TimeSpan)
          values << x.id
        else
          values << x
        end
      }
      value.clear.push values
    end
  end

  def to_hash(val)
    begin
      if val.start_with?(ActiveFedora.fedora.host) && ActiveFedora::Base.exists?(ActiveFedora::Base.uri_to_id(val))
        ActiveFedora::Base.find(ActiveFedora::Base.uri_to_id(val)).uri
      elsif val.starts_with?(Rails.configuration.authority_path) && ActiveFedora::Base.exists?(val.to_s.gsub(/.*\//,''))
        ActiveFedora::Base.find(val.to_s.gsub(/.*\//,'')).uri
      else
        val
      end
    rescue
      val
    end
  end
end
