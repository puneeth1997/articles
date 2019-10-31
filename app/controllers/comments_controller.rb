class CommentsController < ApplicationController
	
	def create
		@article = Article.find_by(id: params[:article_id])
		@comment = @article.comments.new(comment_params)
		
		if @comment.save
			redirect_to article_path(@article)

		else
			render 'articles/show'
		end		
	end

	def destroy
		@article= Article.find_by(id: params[:article_id])
		@comment = @article.comments.find_by(id: params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private

	def comment_params
    	params.require(:comment).permit(:commenter, :body)
    end
end
