class Api::LoginController < ApplicationController
  def login
    data = {}
    member = Members.find_by(email: params[:form][:email])
    if member && member.authenticate(params[:form][:password])
      data = {
        member: member
      }
    end

    render :json => data
  end
end
