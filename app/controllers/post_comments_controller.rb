class PostCommentsController < ApplicationController
   def create
    post_comments = current_user.favorites.build(book_id: params[:book_id])
    post_comments.save
    redirect_back(fallback_location: books_path)
   end
   def destroy
    post_comments = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    post_comments.destroy
    redirect_back(fallback_location: books_path)
   end
end
