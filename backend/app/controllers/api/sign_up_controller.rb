class Api::SignUpController < ApplicationController
  def sign_up
    data = nil

    if params[:form][:name] && params[:form][:email] && params[:form][:password] && params[:form][:password_confirm]
      return
    end

    if params[:form][:password] === params[:form][:password_confirm]
      return
    end

    data = Members.create!(
      name: params[:form][:name],
      gender: params[:form][:gender],
      address: params[:form][:address],
      email: params[:form][:email],
      birthday: params[:form][:birthday],
    )

    render :json => data
  end
end
