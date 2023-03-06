class CartsController < ApplicationController


def show
    if current_user
        @cart = @current_user.cart   
    else
        flash[:failure] = "You must log in to see your cart"
        redirect_to new_session_path
    end
    
end


end
