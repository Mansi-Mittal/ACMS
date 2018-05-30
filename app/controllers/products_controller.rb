class ProductsController < ApplicationController

     skip_before_action :verify_authenticity_token  

    def index
        data = []
        products = Product.where("category=?",params[:category])
        products.each do |product|
            info = {}
            info["id"] = product.id
            info["name"] = product.name
            info["IMAGE_URL"] = product.image
            data << info
            #data.merge!("": info)
        end

        render json:data, status:200  
    end

    def show
        data = {}
    	#@product = Product.find_by_id(params[:id])
        product = Product.find_by_id(params[:id])
        #data["product"]= product
        #return response_data product ,"product" ,200

        data["name"] = product.name
        data["category"] = product.category
        data["IMAGE_URL"] = product.image 
        render json: data 
        end

    #def new 
    #	@product = Product.new
    #end

    def new
        data = {}
        name = params["name"]
        category = params["category"]
        img = params["image"]
        decodedImg = StringIO.new(Base64.decode64(img))
    	product = Product.create(name: name, category: category, image: decodedImg)
    	if product.save
            product[:Image_Url] = product.image
            #data["image"] = product.image
			return response_data nil, "Successfully added product!", 200
		else
			return response_data nil, "Error Occurred while saving!", 200
		end	
    end

    def product_params
	#	params.require(:product).permit(:name, :category)
    end
end
