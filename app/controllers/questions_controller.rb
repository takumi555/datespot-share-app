class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: :desc)

  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user

  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, notice: '投稿が完了しました'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
    
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
