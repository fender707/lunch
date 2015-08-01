class OrdersController < ApplicationController


def index
  @orders = Order.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
end

def create
  @order = Order.new(order_params)
  @order.add_line_items_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render action: "new" 
    end
  end
end

def new
  @cart = current_cart
  if @cart.line_items.empty?
  redirect_to root_path, notice: "Your cart is empty"
  return
  end
  @order = Order.new
  respond_to do |format|
    format.html
  end
end

 private

 def find_order
   @order = Order.find(params[:id])
 end

 def order_params
   params.require(:order).permit(:name, :address, :email)
 end


end
