class SectionsController < ApplicationController
  
layout "admin"

before_action :confirm_logged_in 
before_action :find_pages, :only => [:new , :create , :edit , :update]
before_action :set_section_count , :only => [:new , :create , :edit , :update]
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice] = "Section created Successfully"
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section =Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "section updated Successfully"
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    falsh[:notice] = "Section destroyed Successfully"
    redirect_to(setions_path)
  end


private

def section_params
  params.require(:section).permit(:page_id , :name , :postion , :visible , :content_type , :content )
end

def find_pages
  @pages = Page.all
end
def set_section_count
    @section_count = Section.count
  if params[:action] == 'new' || params[:action] == 'create'
    @section_count += 1
  end
end


end
