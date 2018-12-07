class CommentsController < ApplicationController
  before_action :get_comment, only: [:show, :edit, :update, :destroy]


  def show

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = current_user

    if @comment.save
      redirect_to question_path(@comment.question)
    else
      flash[:errors] = @comment.errors.messages
      redirect_to question_path(@comment.question)
    end
  end

  def edit
    @question = @comment.question
  end

  def update
    if comment_params[:question_id]
      if @comment.commenter == current_user
        if @comment.update(comment_params)
          redirect_to question_path(@comment.question)
        else
          flash[:errors] = @comment.errors.messages
          redirect_to edit_comment_path
        end
      elsif @comment.question.author == current_user
        if @comment.update(comment_params)
          redirect_to question_path(@comment.question)
        else
          flash[:errors] = @comment.errors.messages
          redirect_to edit_comment_path
        end
      end
    elsif comment_params[:votes]
      @comment.change_votes comment_params[:votes]
      redirect_to question_path(@comment.question)
    elsif comment_params[:approachability_rating]
      @comment.change_approachability_rating comment_params[:approachability_rating]
      redirect_to question_path(@comment.question)
    end


  end

  def destroy
    @question = @comment.question
    if @comment.commenter == current_user
       @comment.destroy
    end
    redirect_to @question
  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter_id, :question_id, :solution, :votes, :statement, :approachability_rating)
  end

end
