module AuthoritiesHelper
  # @field
  # @values
  # @options
  # Render HTML for attributes
  def render_attribute (field, values, options = {})
    renderer = ::CurationConcerns::Renderers::AttributeRenderer.new field, values, options
    renderer.render
  end

  # @value
  # Extract uri from the authority hash
  def hash_to_uri(value)
    if value.is_a? ActiveTriples::Relation
      values = []
      value.map { |x|
        if Authority.is_authority? x
          values << x.uri.to_s
        else
          values << x
        end
      }
      value.clear.push values
    end
  end
end
