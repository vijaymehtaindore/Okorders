class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy,
                                      :follow_topic, :follow_user]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    @question =
      Question.new(question_name: question_params[:question_name],
                   user_id: current_user.id)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def follow_topic
    @topic = Topic.new(question_id: @question.id, user_id: current_user.id)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @question, notice: 'Topic is followed successfully.' }
      else
        format.html { redirect_to @question, alert: @topic.errors.full_messages.first }
      end
    end
  end

  def follow_user
    @follow_question_user = Following.new(following_id: @question.user_id, user_id: current_user.id)
    respond_to do |format|
      if @follow_question_user.save
        format.html { redirect_to @question, notice: 'User is followed successfully.' }
      else
        format.html { redirect_to @question, alert: @follow_question_user.errors.full_messages.first }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_name)
    end
end
