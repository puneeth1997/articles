class ArticlesController < ApplicationController

	before_action  :get_article, only:[:show, :edit, :update, :destroy]
	def new
		@categories= Category.all
		@article = Article.new
	end

	def create
		@category = Category.find_by(id: params[:article][:category_id])
		@article = @category.articles.new(article_params)
		if @article.save
			redirect_to article_path(@article.id)

		else
			render 'new'
		end
	end

	def show
		
	end	

	def index
		@articles = Article.all
	end

	def edit
	
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end
	def update
		
		if @article.update(article_params)
			redirect_to article_path(@article.id)

		else
			render 'edit'
		end
	end
	private

	def article_params
		params.require(:article).permit(:title, :text)
	end

	def get_article
		@article = Article.find_by(id: params[:id])
	end

end
