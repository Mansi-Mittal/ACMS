class CartsController < ApplicationController

     skip_before_action :verify_authenticity_token  

	def new
		product_id = params["Product_id"]
		user_id = params["Seller_id"]
		cart = Cart.create(user_id: user_id, Product_id: product_id, qty: 1)
		if cart.save
			return response_data nil, "successfully added to wishlist",200
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
            info["price"] = product.price
            info["Qty"] = cart.qty
            info["IMAGE_URL"] = product.image
            data << info
            #data.merge!("": info)
        end

        render json:data, status:200  
	end

	def destroy
		user_id = params[:Seller_id]
		product_id = params[:Product_id]
		cart = Cart.where("user_id = ? AND product_id = ?",user_id,product_id)
		cart.destroy_all
		return response_data nil, "successfully Deleted",200
	end

	def exist
		user_id = params[:Seller_id]
		product_id = params[:Product_id]
		cart = Cart.where("user_id = ? AND product_id = ?",user_id,product_id)
		if cart.any?
			data["message"] = "Found"
			render json:data
			#return response_data nil, "Found",200
		else
			data["message"] = "Not Found"
			render json:data
			#return response_data nil, "Not Found",200
		end	
		   	
	end
	#def cart_params
	#	params.require(:cart).permit(:user_id)	
	#end
end
