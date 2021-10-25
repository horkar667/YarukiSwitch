class Public::WordCommentsController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    comment = current_user.word_comments.new(word_comment_params)
    comment.word_id = @word.id
    comment.save
    word = comment.word
    word.create_notification_comment!(current_user, comment.id)
  end

  def destroy
    @word = Word.find(params[:word_id])
    WordComment.find_by(id: params[:id], word_id: @word).destroy
  end

  private

  def word_comment_params
    params.require(:word_comment).permit(:comment)
  end
end
