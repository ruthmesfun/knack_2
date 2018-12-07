class QuestionsController < ApplicationController
  before_action :get_question, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q]
      question_search = params[:q].downcase
      @questions = Question.search(question_search)
    else
      @questions = Question.all
    end
  end

  def show
    @solutions = @question.comments.where("solution = true")
    @comments = @question.comments.where("solution = false")
    @comment = Comment.new
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @question = Question.new(question_params)
    @question.author = current_user

    if @question.save
      redirect_to @question
    else
      flash[:errors] = @question.errors.messages
      redirect_to new_question_path
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @question.author == current_user
       if @question.update(question_params)
         redirect_to @question
       else
         flash[:errors] = @question.errors.messages
         redirect_to edit_question_path(@question)
       end

       # @question.update(question_params)
       # redirect_to @question


    end

  end

  def destroy
    if @question.author == current_user
        @question.destroy
        redirect_to questions_path
    end
  end



  private

  def get_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description, :author_id, :category_id, :helpful_filter)
  end


end
