# frozen_string_literal: true

class LikesController < ApplicationController
  def index
    @like = current_user.articles
  end

  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.create(id: params[:id])
    redirect_to articles_path
  end
  # def liked_articles
  #  @article = Article.find(params[:id])
  #  @likes =@article.users
  # end
end
