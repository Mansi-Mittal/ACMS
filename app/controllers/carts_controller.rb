class CartsController < ApplicationController

	def new
		@product = Product.find(params[:Product_id])
		@cart = Cart.new()
		@cart.Product_id = @product.id
		if @cart.save
			return redirect_to carts_path, notice: "Successfully added scheme!"
		else
			return redirect_to product_path(:id => @product.id), notice: "Error Occurred while saving!"
		end	
	end

	def index
		@cart=Cart.all
	end

	def cart_params
		params.require(:cart).permit(:user_id)	
	end
end
