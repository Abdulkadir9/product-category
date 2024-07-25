class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def create
        @category = Category.create(category_params)
        if @category.save
            redirect_to :categories
        else
            render :new
        end
    end

    def new
        @category = Category.new
    end

    def edit
        set_category
    end

    def show
        set_category
    end

    def update
        set_category
        @category.update(category_params)
        redirect_to :categories
    end

    def destroy
        set_category
        @category.destroy
        redirect_to :categories
    end


    private 

    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end

