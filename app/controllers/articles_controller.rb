class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	def show
	end
	def index
		@articles=Article.all
	end
	def new
		@article=Article.new
	end

	def edit
		# @article=Article.find(params[:id])
	end


	def create
		@article=Article.new(create_update_article_params)
		if @article.save
			flash[:notice]="Article was created successfully!"
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		# @article=Article.find(params[:id])
		if @article.update(create_update_article_params)
			flash[:notice]="Article was updated successfully!"
			redirect_to @article
		else
			render 'edit'
		end
	end


	def destroy
		# @article=Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
	def set_article
		@article=Article.find(params[:id])
	end

	def create_update_article_params
		params.require(:article).permit(:title, :description)
	end

end