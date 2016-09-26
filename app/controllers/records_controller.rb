# Extends and customizes the RecordsController in hydra-editor
class RecordsController < ApplicationController
  include RecordsControllerBehavior

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

  protected

    def redirect_after_create
      redirect_after_update
    end

    def redirect_after_update
      "/authorities/#{resource.class.name.downcase}/#{resource.id}"
    end
end
