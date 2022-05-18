class PagesController < ApplicationController
  
  def home
    @articles = Article.all
    @tracked = current_user.articles
  end
end
