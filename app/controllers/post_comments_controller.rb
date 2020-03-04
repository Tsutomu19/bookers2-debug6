class PostCommentsController < ApplicationController
   def create
    post_comment = current_user.post_comments.build(post_comment_params)
    post_comment.book_id = (params[:book_id])
    post_comment.save
    redirect_back(fallback_location: books_path)
   end
   def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_back(fallback_location: books_path)
   end
   private
   def post_comment_params
      params.require(:post_comment).permit(:comment)
  end

end
# createの記述に関して。。。。。こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、post_comment.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。

    # @post_comment = PostComment.new(comment_params)
    # @post_comment.user_id = current_user.id