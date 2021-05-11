class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    @answer_question = @answer.question
    if @answer.save!
      @answer_question.create_notification_answer!(current_user, @answer.id)
      render :index
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy!
    render :index
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end
end