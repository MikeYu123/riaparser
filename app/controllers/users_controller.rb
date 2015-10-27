class UsersController < ApplicationController
  ## route for displaying preferences menu
  def edit_prefs
    @categories_chosen = current_user.preferences
    @categories_available = Category.all.pluck(:name) - @categories_chosen
  end

  ## route for updating user preferences
  def update_prefs
    current_user.preferences = params[:preferences]
    render plain: "1"
  end
end
