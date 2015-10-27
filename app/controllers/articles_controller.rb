class ArticlesController < ApplicationController
  ## Route for displaying all feed items
  def index
    @articles = Article.all.order(published: :desc)
  end

  ## Route for grouping and displaying feed items per category
  def by_category
    @articles = Hash.new
    if params[:category_id]
      @categories = Category.where(id: params[:category_id])
    else
      @categories = Category.all
    end
    @categories.each do |cat|
      @articles[cat.name] = cat.articles
    end
    @all_categories = Category.all
  end

  ## route for displaying preferred news for user
  def my_feed
    prefs = User.prefs_from_string current_user.prefs
    @articles = []
    prefs.each do |cat|
      category = Category.find_by(name: cat)
      category.articles.order(published: :desc).each do |article|
        @articles << article
      end
    end
  end

  ## route for displaying one article
  def show
    @article = Article.find(params[:id])
  end
end
