class PublicController < ApplicationController
  
  layout 'public'

  def index
  end

  def show
  	@page = Page.visible.where(params[:parmalink]).first
  	if @page=nil?
  		redirect_to(root_path)
  	end
  end
end
