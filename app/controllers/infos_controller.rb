class InfosController < ApplicationController

  def index
    @menus = Menu.all
  end

end
