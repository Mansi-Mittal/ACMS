class CartsController < ApplicationController

	def new
		@product = Product.find(params[:Product_id])
		@cart = Cart.new()
		@cart.Product_id = @product.id
		if @cart.save
			return response_data nil, "successfully added to cart", 200
		else
			return response_data nil, "Error Occurred while saving!", 200
		end	
	end

	def index
		#@cart=Cart.all
		data = {}
		cart = Cart.where("user_id=?",params[:user_id])
		data["cart"]=cart
		return response_data data, "cart items", 200
	end

	#def cart_params
	#	params.require(:cart).permit(:user_id)	
	#end
end
