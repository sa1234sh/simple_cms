class SectionsController < ApplicationController
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
      redirect_to(section_path)
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
  params.requaire(:section).permit(:page_id , :name , :position , :visible , :content_type , :content )
end

end
