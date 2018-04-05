class WishlistsController < ApplicationController
	def new
		@product = Product.find(params[:Product_id])
		@wishlist = Wishlist.new()
		@wishlist.Product_id = @product.id
		if @wishlist.save
			return redirect_to wishlists_path, notice: "Successfully added scheme!"
		else
			return redirect_to product_path(:id => @product.id), notice: "Error Occurred while saving!"
		end	
	end

	def index
		@wishlist=Wishlist.all
	end

	def wishlist_params
		params.require(:wishlist).permit(:user_id)	
	end
end
