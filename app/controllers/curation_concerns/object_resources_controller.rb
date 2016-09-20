# Generated via
#  `rails generate curation_concerns:work ObjectResource`

module CurationConcerns
  class ObjectResourcesController < ApplicationController
    include CurationConcerns::CurationConcernController
    self.curation_concern_type = ObjectResource

    # Display the form the the user.
    def new
      curation_concern.created_date_attributes = [{label: 'LABEL'}]
      curation_concern.spatial_attributes = [{label: 'LABEL'}]
      build_form
    end

    def edit
      curation_concern.created_date_attributes = [{label: 'LABEL', note: ''}] if curation_concern.created_date.nil? || curation_concern.created_date.empty?
      curation_concern.event_date_attributes = [{label: 'LABEL', note: ''}] if curation_concern.event_date.nil? || curation_concern.event_date.empty?
      curation_concern.spatial_attributes = [{name: 'LABEL', city: '', state: ''}] if curation_concern.spatial.nil? || curation_concern.spatial.empty?
      build_form
    end

    def show_presenter
      ::ObjectResourceShowPresenter
    end
  end
end
