class QuestionsController < ApplicationController
  before_filter :auth, only: [:create, :your_questions, :edit, :update]

  def index
  	@question = Question.new
  	@questions = Question.unsolved(params)
  end

  def create
  	@question = current_user.questions.build(params[:question])
  	if @question.save
  		flash[:success] = 'Your question has been posted!'
  		redirect_to @question
  	else
  		@questions = Question.unsolved(params)
  		render 'index'
  	end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def your_questions
    @questions = current_user.your_questions(params)
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = current_user.questions.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:success] = "Your Q has been updated!"
      redirect_to @question
    else
      render 'edit'
    end
  end

  def search
    @questions = Question.search(params)
  end
end
