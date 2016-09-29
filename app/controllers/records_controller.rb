# Extends and customizes the RecordsController in hydra-editor
class RecordsController < ApplicationController
  include RecordsControllerBehavior
  include AuthoritiesHelper

  def index
    redirect_to "/"
  end

  def show
    resource = ActiveFedora::Base.find(params[:id])
    if (resource.nil?)
      flash[:error] = "Resource doesn't exist: #{params[:id]}"
      redirect_to "/"
    else
      redirect_to "/authorities/#{resource.class.name.downcase}/#{params[:id]}"
    end
  end

  def deny_access(exception)
    redirect_to({ controller: :catalog, action: 'show' }, alert: "Error: #{exception.message}")
  end

  def build_form
    resource.attributes.each do |key, value|
      hash_to_uri value
    end
    form_class.new(resource)
  end

  def set_attributes
    resource.attributes = collect_form_attributes
    resource.attributes.each do |key, value|
      if value.is_a? ActiveTriples::Relation
        values = []
        value.map { |v| values << to_hash(v) }
        value.clear.push values
      else
         resource.attributes[key] = to_hash(value)
      end
    end
  end

  protected

    def redirect_after_create
      redirect_after_update
    end

    def redirect_after_update
      "/authorities/#{resource.class.name.downcase}/#{resource.id}"
    end
end
