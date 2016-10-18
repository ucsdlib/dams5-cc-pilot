# Generated via
#  `rails generate curation_concerns:work ObjectResource`

module CurationConcerns
  class ObjectResourcesController < ApplicationController
    include CurationConcerns::CurationConcernController
    include AuthoritiesHelper
    include MembersHelper
    self.curation_concern_type = ObjectResource

    # Display the form the the user.
    def new
      curation_concern.created_date_attributes = [{label: 'LABEL'}]
      build_form
    end

    def edit
      curation_concern.created_date_attributes = [{label: 'LABEL', note: ''}] if curation_concern.created_date.nil? || curation_concern.created_date.empty?
      build_form
    end

    def build_form
      curation_concern.attributes.each do |key, value|
        hash_to_uri value
      end

      @form = form_class.new(curation_concern, current_ability)
    end

    def show_presenter
      ::ObjectResourceShowPresenter
    end
  end
end
