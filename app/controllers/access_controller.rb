class AccessController < ApplicationController
  
  layout 'admin'
  before_action :confirm_logged_in , :except => [:attempt_login, :logout , :login]
  def menu
  end

  def login
  end

  def attempt_login
  	if params[:username].present? == params[:password].present?
  		found_user = AdminUser.where(:username => params[:username]).first
  		if found_user
  			#binding.pry
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end	

  	if authorized_user
  		session[:user_id] = authorized_user.id
  		flash[:notice] = "You are now logged in."
  		redirect_to(admin_path)
  	else
  		flash.now[:notice] = "You enterd wrong username/password."
  		render('login')
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "You are logged out."
  	redirect_to(access_login_path)
  end

private

def confirm_logged_in
	unless session[:user_id]
		flash[:notice] = "Please log in."
		redirect_to(access_login_path)
	end
end


end
