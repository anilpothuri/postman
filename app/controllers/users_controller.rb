# frozen_string_literal: true

class UsersController < ApplicationController
  def my_portfolio
    @article = Article.all
    # @tracked= current_user.articles
  end

  def my_likes
    @likes = current_user.likes
  end
end
