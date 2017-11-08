class AttemptsController < ApplicationController


	def new
		@quiz = Quiz.find(params[:quiz_id])
		@user = current_user

		results = Attempt.where(:user_id => @user.id, :quiz_id => @quiz.id)
		
		if results.count==0
			@attempt = Attempt.new()
			@attempt.user = current_user
			@attempt.quiz = @quiz
			@attempt.save

			@attempt.state += 1
			@attempt.save

			q = Question.where(:qno => @attempt.state, :quiz_id => @quiz.id)
			@qu = q[0]

			x = @qu.quiz_id
			y = x.to_s

			a = @qu.id
			b = a.to_s

			path = "/quizzes/" + y + "/questions/" + b

			redirect_to path

		else
			results[0].destroy
			@attempt = Attempt.new()
			@attempt.user = current_user
			@attempt.quiz = @quiz
			@attempt.save


			@attempt.state += 1
			@attempt.save

			q = Question.where(:qno => @attempt.state, :quiz_id => @quiz.id)
			@qu = q[0]

			x = @qu.quiz_id
			y = x.to_s

			a = @qu.id
			b = a.to_s

			path = "/quizzes/" + y + "/questions/" + b

			redirect_to path
		end

	end

	def edit
		@quiz = Quiz.find(params[:quiz_id])
		@user = current_user

		results = Attempt.where(:user_id => @user.id, :quiz_id => @quiz.id)

		if results.count==0

			@attempt = Attempt.new()
			@attempt.user = current_user
			@attempt.quiz = @quiz
			@attempt.save

			@attempt.state += 1
			@attempt.save

			q = Question.where(:qno => @attempt.state, :quiz_id => @quiz.id)
			@qu = q[0]

			x = @qu.quiz_id
			y = x.to_s

			a = @qu.id
			b = a.to_s

			path = "/quizzes/" + y + "/questions/" + b

			redirect_to path


		else
			st = results[0].state
			if(st > @quiz.numquestions)
				redirect_to root_url
			else
				q = Question.where(:qno => st, :quiz_id => @quiz.id)
				@qu = q[0]

				x = @qu.quiz_id
				y = x.to_s

				a = @qu.id
				b = a.to_s

				path = "/quizzes/" + y + "/questions/" + b

				redirect_to path
			end

		end


	end

end
