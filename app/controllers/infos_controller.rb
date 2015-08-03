class InfosController < ApplicationController

  def index
    if params[:filter]
      @menus = Menu.filter(params[:filter]).order("Created_at DESC")
    elsif params[:time_ago]
      @menus = Menu.time_ago(params[:time_ago]);
    else
      @menus = Menu.order("Created_at DESC").limit(5);
    end
    @cart = current_cart
    @menusall = Menu.all
  end

end
