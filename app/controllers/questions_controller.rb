class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :baria_user, only: [:edit, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc)

  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answer = Answer.new
    @answers = @question.answers


  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, notice: '投稿が完了しました！'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
    
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, notice: '更新が完了しました！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to questions_path, notice: '削除しました'
  end


private
  def question_params
    params.require(:question).permit(:title, :content)
  end

  def baria_user 
    unless Question.find(params[:id]).user_id == current_user.id
      flash[:notice] = "権限がありません"
      redirect_to questions_path
    end
  end

end
