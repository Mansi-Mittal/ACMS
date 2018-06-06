class ProductsController < ApplicationController

     skip_before_action :verify_authenticity_token  

    def index
        data = []
        if params[:category]
            products = Product.where("category=?",params[:category])
        end
        if params[:user_id]
            products = Product.where("user_id=?",params[:user_id])
        end
        products.each do |product|
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
        price = params["price"]
        brand = params["brand"]
        colour = params["colour"]
        user_id = params["user_id"]
        decodedImg = StringIO.new(Base64.decode64(img))
    	product = Product.create(name: name, category: category, image: decodedImg, current_price: price, brand: brand, colour: colour,user_id: user_id)
    	if product.save
            product[:Image_Url] = product.image
            #data["image"] = product.image
			return response_data nil, "Successfully added product!", 200
		else
			return response_data nil, "Error Occurred while saving!", 200
		end	
    end

    #def search 
      #products = []
      #searchparams = params[:search].split(" ")
      #searchparams.each do |params|
       # result = Product. where("name LIKE ? OR category LIKE ?", "%"+params+"%", "%"+params+"%").order("created_at DESC")
       # products << result
      #end

      #results = Post.where(arel_query)
      #if params[:search]
      #  products = Product. where("name LIKE ? OR category LIKE ?", "%"+searchp+"%", "%"+searchp+"%").order("created_at DESC")
      #else
      #  products = Product.all.order('created_at DESC')
      #end

    #    products = Product.search(params[:search])
    #    render json: products
    #end

    def search
        query = params[:search]
        words = query.to_s.strip.split
        words.map! { |word| "(name LIKE '%#{word}%' OR category LIKE '%#{word}%' OR colour LIKE '%#{word}%' OR brand LIKE '%#{word}%')" }
        sql = words.join(" AND ")
        products = Product.where(sql)
        data =[]
        products.each do |product|
            info = {}
            info["id"] = product.id
            info["name"] = product.name
            info["IMAGE_URL"] = product.image
            data << info
            #data.merge!("": info)
        end
        render json: data
    end

    def product_params
	#	params.require(:product).permit(:name, :category)
    end
end
