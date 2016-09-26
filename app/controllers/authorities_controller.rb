class AuthoritiesController < ApplicationController
  include AuthoritiesHelper

  def show
    path = Rails.application.routes.recognize_path(request.env['PATH_INFO'])
    authority_type = path[:authority]

    if (["agent", "concept", "place"].include?(authority_type))
      @obj = ActiveFedora::Base.find(params[:id])
    else
      redirect_to "/"
    end

  end
end
