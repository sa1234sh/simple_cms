class SubjectsController < ApplicationController
  
  layout "admin"

  before_action :confirm_logged_in
  before_action :set_subject_count , :only => [:new , :create, :edit , :update]
  def index
    logger.debug("*** Testing the logger ***")
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    #binding.pry
    #creating new instances
    @subject = Subject.new(subject_params)
    #saving the instance
    if @subject.save
    #if inputs succed goes to index path
    flash[:notice] = "Subject created successfully"
    redirect_to(subjects_path)
    else
    #if any error in inputs goes back to the new page
    render('new')
  end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destoryed successfully"
    redirect_to(subjects_path)
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #updating instances
    @subject = Subject.find(params[:id])
    #saving the instance
    if @subject.update_attributes(subject_params)
    #if inputs succed goes to index path
    flash[:notice] = "Subject updated successfully"
    redirect_to(subject_path(@subject))
    else
    #if any error in inputs goes back to the new page
    render('edit')
  end
  end

  private

  def  subject_params 
    params.require(:subject).permit(:name , :position , :visible , :created_at)
  end
  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
     @subject_count += 1
    end
  end


end


