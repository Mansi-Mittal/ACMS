class ProductsController < ApplicationController
def index
        @products = Product.where("category=?",params[:category])
    end

    def show
    	@product = Product.find_by_id(params[:id])
    end

    def new 
    	@product = Product.new
    end

    def create
    	@product = Product.create(product_params)
    	if @product.save
			return redirect_to products_path(:category => @product.category), notice: "Successfully added scheme!"
		else
			return redirect_to new_product_path, notice: "Error Occurred while saving!"
		end	
    end

    def product_params
		params.require(:product).permit(:name, :category)	
	end
end
