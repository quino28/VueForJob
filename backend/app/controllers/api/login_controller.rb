class Api::LoginController < ApplicationController
    def get
     render :json => { 'data': { 'succeed' }}
    end

    def login
     render :json => { 'data': { 'succeed' }}
    end
  end
end
