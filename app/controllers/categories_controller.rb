class CategoriesController < ApplicationController

	def new
		@category= Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to category_path(@category.id)

		else
			render 'new'
		end	
	end

	def index
		@categories = Category.all
	end

	def show 
		@category= Category.find_by(id: params[:id])

	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
