class DemoController < ApplicationController
  
layout "application"

  def index
  	render('index')
  	
  end

  	def test
  		@array = [1,2,3,4,5]
  		@id = params['id']
  		@page = params[:page]
  		render('test')

  		
  end



  def other_hello
  	redirect_to(:action => 'test')
  end

  def escape_output
  end 

end


