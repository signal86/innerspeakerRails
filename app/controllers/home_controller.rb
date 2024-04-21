class HomeController < ApplicationController
  def index
      @serverData = ServerHead.find(1)
  end
end
