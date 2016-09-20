class EdmPlaceInput < MultiValueInput
  include InputBase

  def input(wrapper_options)
    super
  end

  protected

    # Delegate this completely to the form.
    def collection
      @collection ||= Array.wrap(object[attribute_name]).reject { |value| value.to_s.strip.blank? }
    end

    def build_field(value, index)
      options = input_html_options.dup

      if value.respond_to? :rdf_label
        options[:name] = name_for(attribute_name, index, 'hidden_label'.freeze)
        options[:id] = id_for(attribute_name, index, 'hidden_label'.freeze)

        if value.new_record?
          build_options_for_new_row(attribute_name, index, options)
        else
          build_options_for_existing_row(attribute_name, index, value, options)
        end
      end

      options[:required] = nil if @rendered_first_element

      options[:class] ||= []
      options[:class] += ["#{input_dom_id} form-control multi-text-field"]
      options[:'aria-labelledby'] = label_id

      @rendered_first_element = true

      out = ''
      out << build_components(attribute_name, value, index, options)
      out << hidden_id_field(value, index) unless value.new_record?
      out
    end

    def build_components(attribute_name, value, index, options)
      out = ''

      edm_place = value

     out << "<div class='row'>"
      # --- latitude
      field = :latitude
      field_name = name_for(attribute_name, index, field)
      field_value = value.new_record? ? '' : edm_place.send(field).first

      out << "  <div class='col-md-1'>"
      out << template.label_tag(field_name, field.to_s.humanize, required: false)
      out << '  </div>'

      out << "  <div class='col-md-5'>"
      out << @builder.text_field(field_name, options.merge(value: field_value, name: field_name))
      out << '  </div>'
      out << '</div>'

     out << "<div class='row'>"
      # --- longitude
      field = :longitude
      field_name = name_for(attribute_name, index, field)
      field_value = value.new_record? ? '' : edm_place.send(field).first

      out << "  <div class='col-md-1'>"
      out << template.label_tag(field_name, field.to_s.humanize, required: false)
      out << '  </div>'

      out << "  <div class='col-md-5'>"
      out << @builder.text_field(field_name, options.merge(value: field_value, name: field_name))
      out << '  </div>'
      out << '</div>'

     out << "<div class='row'>"
      # --- altitude
      field = :altitude
      field_name = name_for(attribute_name, index, field)
      field_value = value.new_record? ? '' : edm_place.send(field).first

      out << "  <div class='col-md-1'>"
      out << template.label_tag(field_name, field.to_s.humanize, required: false)
      out << '  </div>'

      out << "  <div class='col-md-5'>"
      out << @builder.text_field(field_name, options.merge(value: field_value, name: field_name))
      out << '  </div>'
      out << '</div>'

     out << "<div class='row'>"
      # --- label
      field = :label
      field_name = name_for(attribute_name, index, field)
      field_value = value.new_record? ? '' : edm_place.send(field).first

      out << "  <div class='col-md-1'>"
      out << template.label_tag(field_name, field.to_s.humanize, required: false)
      out << '  </div>'

      out << "  <div class='col-md-5'>"
      out << @builder.text_field(field_name, options.merge(value: field_value, name: field_name))
      out << '  </div>'
      out << '</div>'

      out << "<div class='row'>"
      # --- note
      field = :note
      field_name = name_for(attribute_name, index, field)
      field_value = value.new_record? ? '' : edm_place.send(field).first

      out << "  <div class='col-md-1'>"
      out << template.label_tag(field_name, field.to_s.humanize, required: false)
      out << '  </div>'

      out << "  <div class='col-md-5'>"
      out << @builder.text_field(field_name, options.merge(value: field_value, name: field_name))
      out << '  </div>'
      out << '</div>'

      out
    end
end
