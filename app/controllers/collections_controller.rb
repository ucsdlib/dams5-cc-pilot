class CollectionsController < ApplicationController
  include CurationConcerns::CollectionsControllerBehavior
  include AuthoritiesHelper

  def form
    @collection.attributes.each do |key, value|
      hash_to_uri value
    end
    @form ||= form_class.new(@collection)
  end

  def form_class
    CollectionEditForm
  end

  def presenter_class
    CollectionShowPresenter
  end

end
