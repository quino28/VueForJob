module Api
  class IndexController < ApplicationController

    # GET /index
    def index
      render html: helpers.tag.strong('test')
    end
  end
end
