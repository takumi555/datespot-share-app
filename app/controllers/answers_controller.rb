class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index

  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    @answer.save!
    render :index
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