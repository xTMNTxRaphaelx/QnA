class AnswersController < ApplicationController
	before_filter :auth, only: [:create]
	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build(params[:answer])
		@answer.user = current_user

		if @answer.save
			flash[:success] = 'Your answer has been posted!'
			redirect_to @question
		else
			@question = Question.find(params[:question_id])
			render 'questions/show'
		end
	end
end
