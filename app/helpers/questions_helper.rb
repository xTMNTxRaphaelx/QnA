module QuestionsHelper

	def on_your_questions_page?
		action_name == 'your_questions'
	end

	def display_solved(question)
		(question.solved) ? ' - (Solved) ' : ''
	end
end
