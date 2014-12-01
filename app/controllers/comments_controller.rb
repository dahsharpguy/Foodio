class CommentsController < ApplicationController
  def create
    @recipe = Recipe.friendly.find(params[:recipe_id])
    @comment = @recipe.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user
    @comment.save

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end 
end
