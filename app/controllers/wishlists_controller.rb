class WishlistsController < ApplicationController
	def new
		@product = Product.find(params[:Product_id])
		@wishlist = Wishlist.new()
		@wishlist.Product_id = @product.id
		if @wishlist.save
			return response_data nil, "successfully added to wishlist"
		else
			return response_data nil, "Error Occurred while saving!", 200
		end	
	end

	def index
		#@wishlist=Wishlist.all
		data = {}
		wishlist = Wishlist.where("user_id=?",params[:user_id])
		data["wishlist"]=wishlist
		return response_data data, "Wishlist items", 200
	end

	#def wishlist_params
	#	params.require(:wishlist).permit(:user_id)	
	#end
end
