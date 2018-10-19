class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.topic_id = params[:topic_id]
    # comment = topic.comments.bild(comment_params)
    if comment.save
      redirect_to topics_path, success: "コメントが投稿できました"
    else
      flash.now[:danger] = "失敗しました"
      render "topics/new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
