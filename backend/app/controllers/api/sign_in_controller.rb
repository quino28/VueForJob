class Api::SignInController < ApplicationController
  def sign_in
    data = {}
    member = Members.find_by(email: params[:form][:email])
    if member && member.authenticate(params[:form][:password])
      data[:member] = {
        name: member.name,
        email: member.email,
        address: member.address,
        gender: member.gender,
      }
    end

    render :json => data
  end
end
