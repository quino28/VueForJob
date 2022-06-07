class Admin::MembersController < ApplicationController
  require 'logger'
  log = Logger.new('./rubyflie.log')

  def index
    log.debug('test')
  end

  def show
    require 'logger'
    log = Logger.new('./rubyflie.log')
    log.debug('show')
    render "members/show"
  end
end
