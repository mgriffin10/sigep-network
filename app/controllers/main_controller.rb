class MainController < ApplicationController
  
  layout false

  def index
  	render('index')
  end

  def profiles
  	render('profiles')
  end

end
