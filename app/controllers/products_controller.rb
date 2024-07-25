class ProductsController < ApplicationController
    def index
        if params[:category_id].present?
            @products = Product.where(category_id: params[:category_id])
        else
            @products = Product.all
        end
    end

    def show
        set_product
    end
    
    def new
        @categories = Category.all
        @product = Product.new
    end
    
    def edit
        set_product
        @categories = Category.all
    end
    
    def create
        @product = Product.create(product_params)
        
        if @product.save
            redirect_to :products
        else
            render :new
        end
    end

    def update
      set_product
      if @product.update(product_params)
        redirect_to :products
      else
        render :new
      end
    end

    def destroy
        set_product
        @product.destroy
        redirect_to :products
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :quantity, :price, :category_id)
    end

    def set_product
        @product = Product.find(params[:id])
    end
end
