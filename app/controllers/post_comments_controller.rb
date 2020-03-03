class PostCommentsController < ApplicationController
   def create
    post_comment = current_user.post_comments.build(book_id: params[:book_id])
    post_comment.save
    redirect_back(fallback_location: books_path)
   end
   def destroy
    post_comment = PostComment.find_by(book_id: params[:book_id], user_id: current_user.id)
    post_comment.destroy
    redirect_back(fallback_location: books_path)
   end
   private
   def post_comment_params
      params.require(:post_comment).permit(:comment)
  end

end
