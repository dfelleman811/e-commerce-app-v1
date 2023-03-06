class CartItemsController < ApplicationController

    def create
        product_to_add = Product.find(params[:product_id])
        @cart = Cart.find(params[:cart_id])

        @cart_item = CartItem.new 
        @cart_item.cart = @cart.id
        @cart_item.product = product_to_add 

        @cart_item.save
        redirect_to cart_path(@cart)
    end

end