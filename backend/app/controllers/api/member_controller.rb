class Api::MemberController < ApplicationController
  def update
    data = {}
    member = {}

    ['name', 'email', 'address', 'gender', 'birthday', 'password'].each do |key|
      if params[:params][key]
        if key ==='password'
          if params[:params][:password_confirm] && params[:params][key] === params[:params][:password_confirm]
            member[key] = params[:params][key]
          end
        else
          member[key] = params[:params][key]
        end
      end
    end
    p member

    @member = Members.find_by(id: params[:params][:id])
    if !member.empty?
      @member.update!(member)
      data[:updated] = true
    end

    data[:member] = {
      id: @member.id,
      name: @member.name,
      email: @member.email,
      address: @member.address,
      gender: @member.gender,
      birthday: @member.birthday,
    }

    render :json => data
  end
end
