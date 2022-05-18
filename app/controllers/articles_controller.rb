# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :article_params, only: %i[like shared update show]
  def search
    if params[:article].present?
      @article = Article.title_matches(params[:article])
      render 'users/my_portfolio'
    else
      flash[:notice] = 'enter a valid title'
      redirect_to root_path
    end
  end

  def like
    Like.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)
  end

  def shared
    Shared.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)
  end

  def index
    @articles = Article.all
    @liked_articles = current_user.articles
  end

  def new
    @article = Article.new
  end

  def show
    @likes = @article.users
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = 'article destroyed succefully'
      redirect_to articles_path
    end
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def article_params
    @article = Article.find(params[:id])
  end
end
