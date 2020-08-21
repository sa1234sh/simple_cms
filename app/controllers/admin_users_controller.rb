class AdminUsersController < ApplicationController

layout 'admin'

  def index
  	@admin_users =AdminUser.sorted
  end

  def new
  	@admin_user = AdminUser.new
  end

  def create
  	@admin_user =AdminUser.new(admin_user_params)
  	if @admin_user.save
  		flash[:noice] = "New AdminUser Created Successfully"
  		redirect_to(admin_user_path)
  	else
  		render('new')
  	end
  end

  def edit
  	@admin_user =AdminUser.find(params[:id])
  end

  def update
  	@admin_user =AdminUser.find(params[:id])
  	if @admin_user.update_attributes(admin_user_params)
  		flash[:notice] = "Admin User Updated Successfully"
  		redirect_to(admin_user_path)
  	else
  		render('edit')
  	end
  end

  def delete
  	@admin_user =AdminUser.find(params[:id])
  end

  def destroy
  	@admin_user =AdminUser.find(params[:id])
  	@admin_user.destroy
  	flash[:notice] = "Admin user destroyed Successfully"
  	redirect_to(admin_user_path)
  end

	private

		def admin_user_params
			params.require (:admin_user).permit(:first_name, :last_name, :emial, :username, :password)
		end

end 


