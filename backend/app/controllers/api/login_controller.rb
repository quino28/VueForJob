class Api::LoginController < ApplicationController
  def login
   render :json => { 'data': 'succeed' }
  end
end
