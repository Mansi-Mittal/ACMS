class CartsController < ApplicationController

     skip_before_action :verify_authenticity_token  

	def new
		product_id = params["Product_id"]
		user_id = params["Seller_id"]
		cart = Cart.create(user_id: user_id, Product_id: product_id);
		if cart.save
			return response_data nil, "successfully added to wishlist"
		else
			return response_data nil, "Error Occurred while saving!", 404
		end	
	end

	def index
		#@cart=Cart.all
		data = []
        cart = Cart.where("user_id=?",params["user_id"])
        cart.each do |cart|
        	id = cart.Product_id
        	product = Product.find_by_id(id)
            info = {}
            info["id"] = product.id
            info["name"] = product.name
            info["price"] = product.current_price
            info["Qty"] = product.current_qty
            info["IMAGE_URL"] = product.image
            data << info
            #data.merge!("": info)
        end

        render json:data, status:200  
	end

	#def cart_params
	#	params.require(:cart).permit(:user_id)	
	#end
end
