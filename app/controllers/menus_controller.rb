class MenusController < ApplicationController
 
  before_action :current_admin
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menus = Menu.all
    respond_with(@menus)
  end

  def show
    respond_with(@menu)
  end

  def new
    @menu = Menu.new
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    respond_with(@menu)
  end

  def update
    @menu.update(menu_params)
    respond_with(@menu)
  end

  def destroy
    @menu.destroy
    respond_with(@menu)
  end

  private

  def current_admin
    if !current_user.admin?
      redirect_to root_path, notice: "You are not admin!"
    end
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:title, :category_id, :image_url, :description, :price)
  end
end
