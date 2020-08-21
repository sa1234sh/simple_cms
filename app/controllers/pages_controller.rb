class PagesController < ApplicationController
  
layout "admin"

before_action :confirm_logged_in 
before_action :find_subjects, :only => [:new , :create , :edit , :update]
before_action :set_page_count, :only => [:new , :create , :edit , :update]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
     end

  def create
    @page = Page.create(page_params)
     if @page.save
      flash[:notice]  = "Pages created Successfully"
      redirect_to(pages_path)
    else
         render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated Successfully"
      redirect_to(pages_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page deleted Successfully"
    redirect_to(pages_path)
  end


private

def page_params
params.require(:page).permit(:subject_id , :name , :visible , :position ,:parmalink) 
end

def find_subjects
  @subjects = Subject.sorted
end

def set_page_count
  @page_count = Page.count
  if params[:action] == 'new' || params[:action] == 'create'
   @page_count += 1
  end
end

end