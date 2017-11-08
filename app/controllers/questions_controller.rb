class QuestionsController < ApplicationController
	def create
		@quiz = Quiz.find(params[:quiz_id])
		@question = @quiz.questions.create(question_params)
		num =  @quiz.numquestions + 1
		puts num
		@quiz.update_attributes(:numquestions => num)
		@question.update_attributes(:qno => num)
		redirect_to quiz_path(@quiz)
	end
	
	def show
		puts params
		@question = Question.find(params[:id])
	end



	def next
		@quiz = Quiz.find(params[:quiz_id])		
		@user = current_user

		results = Attempt.where(:user_id => @user.id, :quiz_id => @quiz.id)

		@att = results[0]

		stat = @att.state

		q = Question.where(:qno => stat, :quiz_id => @quiz.id)
		@question = q[0]



		ansA = false
		ansB = false
		ansC = false
		ansD = false

		if(params[:ansA])
			ansA = true
		end
		if(params[:ansB])
			ansB = true
		end
		if(params[:ansC])
			ansC = true
		end
		if(params[:ansA])
			ansD = true
		end

		flagA = @question.flagA
		flagB = @question.flagB
		flagC = @question.flagC
		flagD = @question.flagD

		sc = 0
		if(ansA==flagA &&  ansB==flagB &&  ansC==flagC &&  ansD==flagD)
			sc=10
		else
			sc=0
		end


		scor = @att.score
		scor += sc
		@att.update_attributes(:score => scor)

		stat += 1
		@att.update_attributes(:state => stat)

		if(stat > @quiz.numquestions)
			redirect_to root_url
		else
			q = Question.where(:qno => stat, :quiz_id => @quiz.id)
			@qu = q[0]

			x = @qu.quiz_id
			y = x.to_s

			a = @qu.id
			b = a.to_s

			path = "/quizzes/" + y + "/questions/" + b

			redirect_to path
		end

	end






	private def question_params
		params.require(:question).permit(:ques_name,:optionA,:flagA,:optionB,:flagB,:optionC,:flagC,:optionD,:flagD)
	end

end
