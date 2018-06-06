class WishlistsController < ApplicationController

     skip_before_action :verify_authenticity_token  

	def new
		product_id = params["Product_id"]
		user_id = params["Seller_id"]
		wishlist = Wishlist.create(user_id: user_id, Product_id: product_id);
		if wishlist.save
			return response_data nil, "successfully added to wishlist"
		else
			return response_data nil, "Error Occurred while saving!", 404
		end	
	end

	def index
		#@wishlist=Wishlist.all
		data = []
        wishlist = Wishlist.where("user_id=?",params["user_id"])
        wishlist.each do |wishlist|
        	id = wishlist.Product_id
        	product = Product.find_by_id(id)
            info = {}
            info["id"] = product.id
            info["name"] = product.name
            info["IMAGE_URL"] = product.image
            data << info
            #data.merge!("": info)
        end

        render json:data, status:200  
	end

	#def wishlist_params
	#	params.require(:wishlist).permit(:user_id)	
	#end
end
